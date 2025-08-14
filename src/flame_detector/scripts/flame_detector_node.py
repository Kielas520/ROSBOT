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

class FlameDetectorNode:
    def __init__(self):
        rospy.init_node('flame_detector_node', anonymous=True)
        
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
        
        # 订阅相机话题
        camera_topic = self.params.get('camera_topic', '/berxel_base/color/image_raw')
        # camera_topic = self.params.get('camera_topic', '/usb_camera_node/head_image_raw')
        rospy.Subscriber(camera_topic, Image, self.image_callback)
        
        # 创建图像发布者
        self.image_pub = rospy.Publisher('/fire', Image, queue_size=10)
        
        rospy.loginfo("火焰检测节点已启动")
    
    def image_callback(self, msg):
        try:
            # 将 ROS 图像转换为 OpenCV 格式
            cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
            orig_height, orig_width = cv_image.shape[:2]
            
            # 预处理图像，调整为模型期望的尺寸（480x480）
            input_width = self.params.get('input_width', 480)
            input_height = self.params.get('input_height', 480)
            input_image = cv2.resize(cv_image, (input_width, input_height))
            input_image = input_image.astype(np.float32) / 255.0  # 归一化
            input_image = np.transpose(input_image, (2, 0, 1))  # 转换为 CHW 格式
            input_image = np.expand_dims(input_image, axis=0)  # 添加 batch 维度
            
            # 运行推理
            outputs = self.ort_session.run(None, {self.input_name: input_image})
            detection_result = outputs[0]  # 形状 [1, 6, N]
            rospy.loginfo(f"检测结果形状: {detection_result.shape}")
            
            # 处理检测结果
            confidence_threshold = self.params.get('confidence_threshold', 0.5)
            annotated_image = cv_image.copy()  # 复制原始图像用于绘制
            
            # 去掉 batch 维度，处理 [6, N]
            detections = detection_result[0]  # 形状 [6, N]
            for i in range(detections.shape[1]):  # 遍历每个检测框
                x_center, y_center, w, h, conf_extinguisher, conf_flame = detections[:, i]
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
                    
                    rospy.loginfo(f"检测到 {label}，置信度: {confidence:.2f}，边界框: [{x1}, {y1}, {x2}, {y2}]")
            
            # 发布处理后的图像到 /fire 话题
            image_msg = self.bridge.cv2_to_imgmsg(annotated_image, encoding='bgr8')
            image_msg.header = msg.header  # 保留原始时间戳和帧ID
            self.image_pub.publish(image_msg)
            
        except Exception as e:
            rospy.logerr(f"图像处理错误: {e}")
    
    def run(self):
        rospy.spin()

if __name__ == '__main__':
    try:
        node = FlameDetectorNode()
        node.run()
    except rospy.ROSInterruptException:
        pass