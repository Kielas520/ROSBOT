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
import random
from flame_detector.srv import DetectFlame, DetectFlameResponse

class FlameDetectorService:
    def __init__(self):
        rospy.init_node('flame_detector_service', anonymous=True)

        # 工作空间根目录
        workspace_dir = os.path.expanduser('~/ros_workspace')

        # 加载 args.yaml
        config_path = os.path.join(workspace_dir, 'src/flame_detector/config/args.yaml')
        try:
            with open(config_path, 'r') as f:
                self.params = yaml.safe_load(f)
        except Exception as e:
            rospy.logerr(f"无法加载 args.yaml: {e}")
            raise

        # 初始化 ONNX 模型
        model_path = os.path.join(workspace_dir, 'src/flame_detector/models/flame_model.onnx')
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
        self.image_updated = False

        # 订阅相机话题
        camera_topic = self.params.get('camera_topic', '/berxel_base/color/image_raw')
        rospy.Subscriber(camera_topic, Image, self.image_callback)

        # 创建图像发布者
        self.image_pub = rospy.Publisher('/fire', Image, queue_size=10)

        # 创建服务
        self.service = rospy.Service('/detect_flame', DetectFlame, self.handle_detect_flame)

        # 确保保存目录存在
        self.save_dir = os.path.join(workspace_dir, 'photos')
        os.makedirs(self.save_dir, exist_ok=True)

        rospy.loginfo("火焰检测服务已启动")

    def image_callback(self, msg):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
            self.latest_image = cv_image
            self.image_updated = True
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
        return input_image, input_width, input_height

    def run_inference(self, input_image):
        """运行 ONNX 模型推理"""
        try:
            outputs = self.ort_session.run(None, {self.input_name: input_image})
            return outputs[0]  # [1, 6, N]
        except Exception as e:
            rospy.logerr(f"推理失败: {e}")
            return None

    def generate_unique_filename(self):
        """生成6位随机数字文件名，确保不重复"""
        while True:
            filename = f"{random.randint(100000, 999999)}.jpg"
            file_path = os.path.join(self.save_dir, filename)
            if not os.path.exists(file_path):
                return file_path

    def handle_detect_flame(self, req):
        response = DetectFlameResponse()
        response.is_flame_detected = False
        response.is_extinguisher_detected = False

        detection_timeout = 2.0
        check_interval = 0.1
        rate = rospy.Rate(1 / check_interval)

        start_time = rospy.Time.now()
        end_time = start_time + rospy.Duration(detection_timeout)

        rospy.loginfo(f"开始持续检测火焰和灭火器，持续 {detection_timeout} 秒...")

        last_processed_time = rospy.Time.now()
        processed_image_hash = None

        while rospy.Time.now() < end_time and not rospy.is_shutdown():
            current_time = rospy.Time.now()

            if self.latest_image is not None and self.image_updated:
                try:
                    current_hash = (self.latest_image.shape[0], self.latest_image.shape[1], current_time.to_nsec() // 100000000)

                    if current_hash != processed_image_hash:
                        processed_image_hash = current_hash
                        self.image_updated = False

                        cv_image = self.latest_image.copy()
                        input_tensor, input_width, input_height = self.preprocess_image(cv_image)
                        detections = self.run_inference(input_tensor)
                        if detections is None:
                            continue

                        # 绘制检测结果
                        annotated_image = cv_image.copy()
                        confidence_threshold = self.params.get('confidence_threshold', 0.25)
                        det = detections[0]
                        orig_width, orig_height = cv_image.shape[1], cv_image.shape[0]

                        for i in range(det.shape[1]):  # 遍历每个检测框
                            x_center, y_center, w, h, conf_extinguisher, conf_flame = det[:, i]
                            if max(conf_flame, conf_extinguisher) > confidence_threshold:
                                # 确定类别
                                label = "Flame" if conf_flame > conf_extinguisher else "Extinguisher"
                                confidence = max(conf_flame, conf_extinguisher)
                                
                                # 缩放坐标到原始图像尺寸
                                scale_x, scale_y = orig_width / input_width, orig_height / input_height
                                x_center, y_center, w, h = [int(v) for v in [x_center * scale_x, y_center * scale_y, w * scale_x, h * scale_y]]
                                
                                # 计算边界框的左上角和右下角
                                x1 = max(0, x_center - w // 2)
                                y1 = max(0, y_center - h // 2)
                                x2 = min(orig_width, x_center + w // 2)
                                y2 = min(orig_height, y_center + h // 2)
                                
                                # 绘制边界框和标签
                                color = (0, 0, 255) if label == "Flame" else (0, 255, 0)  # 火焰红色，灭火器绿色
                                cv2.rectangle(annotated_image, (x1, y1), (x2, y2), color, 2)
                                cv2.putText(annotated_image, f"{label}: {confidence:.2f}", (x1, y1 - 10), 
                                           cv2.FONT_HERSHEY_SIMPLEX, 0.5, color, 2)

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

                        # 保存带注释的图像
                        try:
                            save_path = self.generate_unique_filename()
                            cv2.imwrite(save_path, annotated_image)
                            rospy.loginfo(f"已保存带检测结果的图像到 {save_path}")
                        except Exception as e:
                            rospy.logerr(f"保存图像失败: {e}")

                        # 发布带注释的图像
                        try:
                            img_msg = self.bridge.cv2_to_imgmsg(annotated_image, encoding="bgr8")
                            self.image_pub.publish(img_msg)
                            rospy.loginfo("已发布带检测结果的图像到 /fire 话题")
                        except Exception as e:
                            rospy.logerr(f"发布图像失败: {e}")

                        if response.is_flame_detected and response.is_extinguisher_detected:
                            break

                except Exception as e:
                    rospy.logerr(f"处理图像时出错: {e}")

            rate.sleep()

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