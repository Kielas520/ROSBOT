#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
import onnxruntime as ort
import numpy as np
import yaml
import os
from flame_detector.srv import DetectFlame, DetectFlameResponse


class FlameDetectorService:
    def __init__(self):
        rospy.init_node('flame_detector_service', anonymous=True)

        # 加载 args.yaml
        config_path = os.path.join(os.path.dirname(__file__), '../config/args.yaml')
        try:
            with open(config_path, 'r') as f:
                self.params = yaml.safe_load(f)
        except Exception as e:
            rospy.logerr(f"无法加载 args.yaml: {e}")
            raise

        # 初始化 ONNX 模型
        model_path = os.path.join(os.path.dirname(__file__), '../models/flame_model.onnx')
        try:
            self.ort_session = ort.InferenceSession(model_path)
            self.input_name = self.ort_session.get_inputs()[0].name
            rospy.loginfo(f"模型输入名称: {self.input_name}")
            rospy.loginfo(f"模型输入形状: {self.ort_session.get_inputs()[0].shape}")
            rospy.loginfo(f"模型输出形状: {self.ort_session.get_outputs()[0].shape}")
        except Exception as e:
            rospy.logerr(f"无法加载 ONNX 模型: {e}")
            raise

        # 初始化 CvBridge
        self.bridge = CvBridge()

        # 图像缓存
        self.latest_image = None
        self.image_updated = False  # 标志位：是否有新图像

        # 订阅相机话题
        camera_topic = self.params.get('camera_topic', '/berxel_base/color/image_raw')
        rospy.Subscriber(camera_topic, Image, self.image_callback)

        # 创建服务
        self.service = rospy.Service('/detect_flame', DetectFlame, self.handle_detect_flame)

        rospy.loginfo("火焰检测服务已启动")

    def image_callback(self, msg):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
            self.latest_image = cv_image
            self.image_updated = True  # 标记图像已更新
            rospy.logdebug(f"收到新图像: {cv_image.shape[1]}x{cv_image.shape[0]}")
        except Exception as e:
            rospy.logerr(f"图像转换错误: {e}")

    def preprocess_image(self, cv_image):
        """预处理图像以符合 ONNX 模型输入"""
        input_width = self.params.get('input_width', 480)
        input_height = self.params.get('input_height', 480)
        input_image = cv2.resize(cv_image, (input_width, input_height))
        input_image = input_image.astype(np.float32) / 255.0
        input_image = np.transpose(input_image, (2, 0, 1))  # HWC -> CHW
        input_image = np.expand_dims(input_image, axis=0)   # NCHW
        return input_image

    def run_inference(self, input_image):
        """运行 ONNX 模型推理"""
        try:
            outputs = self.ort_session.run(None, {self.input_name: input_image})
            return outputs[0]  # [1, 6, N]
        except Exception as e:
            rospy.logerr(f"推理失败: {e}")
            return None

    def handle_detect_flame(self, req):
        response = DetectFlameResponse()
        response.is_flame_detected = False
        response.is_extinguisher_detected = False

        detection_timeout = 2.0  # 检测持续时间（秒）
        check_interval = 0.1     # 每 0.1 秒检查一次图像
        rate = rospy.Rate(1 / check_interval)

        start_time = rospy.Time.now()
        end_time = start_time + rospy.Duration(detection_timeout)

        rospy.loginfo(f"开始持续检测火焰和灭火器，持续 {detection_timeout} 秒...")

        # 用于避免重复处理同一帧
        last_processed_time = rospy.Time.now()
        processed_image_hash = None

        while rospy.Time.now() < end_time and not rospy.is_shutdown():
            current_time = rospy.Time.now()

            # 只处理新图像，避免重复推理
            if self.latest_image is not None and self.image_updated:
                try:
                    # 简单去重：用图像尺寸 + 时间判断是否为新帧
                    current_hash = (self.latest_image.shape[0], self.latest_image.shape[1], current_time.to_nsec() // 100000000)

                    if current_hash != processed_image_hash:
                        processed_image_hash = current_hash
                        self.image_updated = False  # 清除更新标志

                        # 深拷贝图像用于推理
                        cv_image = self.latest_image.copy()

                        # 预处理
                        input_tensor = self.preprocess_image(cv_image)

                        # 推理
                        detections = self.run_inference(input_tensor)
                        if detections is None:
                            continue

                        # 解析结果
                        confidence_threshold = self.params.get('confidence_threshold', 0.3)
                        det = detections[0]  # [6, N]

                        for i in range(det.shape[1]):
                            conf_extinguisher = det[4, i]
                            conf_flame = det[5, i]

                            if conf_flame > confidence_threshold and not response.is_flame_detected:
                                response.is_flame_detected = True
                                rospy.loginfo(f"✅ 检测到火焰，置信度: {conf_flame:.2f}")

                            if conf_extinguisher > confidence_threshold and not response.is_extinguisher_detected:
                                response.is_extinguisher_detected = True
                                rospy.loginfo(f"✅ 检测到灭火器，置信度: {conf_extinguisher:.2f}")

                            # 两个都检测到了可以提前优化（可选）
                            if response.is_flame_detected and response.is_extinguisher_detected:
                                rospy.loginfo("🔥 和 🧯 均已检测到，提前结束检测")
                                break

                        # 如果两个都已检测到，提前退出循环
                        if response.is_flame_detected and response.is_extinguisher_detected:
                            break

                except Exception as e:
                    rospy.logerr(f"处理图像时出错: {e}")

            # 控制循环频率
            rate.sleep()

        # 最终日志
        if not response.is_flame_detected and not response.is_extinguisher_detected:
            rospy.loginfo("🔚 2 秒内未检测到火焰或灭火器")

        return response

    def run(self):
        rospy.spin()


if __name__ == '__main__':
    try:
        node = FlameDetectorService()
        node.run()
    except rospy.ROSInterruptException:
        pass