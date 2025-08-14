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
        
        # 订阅相机话题，缓存最新图像
        self.latest_image = None
        # 订阅相机话题
        #camera_topic = self.params.get('camera_topic', '/bottom_camera/image_raw')
        camera_topic = self.params.get('camera_topic', '/usb_camera_node/head_image_raw')
        rospy.Subscriber(camera_topic, Image, self.image_callback)
        
        # 创建服务
        self.service = rospy.Service('/detect_flame', DetectFlame, self.handle_detect_flame)
        
        rospy.loginfo("火焰检测服务已启动")
    
    def image_callback(self, msg):
        try:
            # 缓存最新图像
            self.latest_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
            rospy.loginfo(f"收到新图像，尺寸: {self.latest_image.shape[1]}x{self.latest_image.shape[0]}")
        except Exception as e:
            rospy.logerr(f"图像转换错误: {e}")
    
    def handle_detect_flame(self, req):
        response = DetectFlameResponse()
        response.is_flame_detected = False
        response.is_extinguisher_detected = False
        
        try:
            # 检查是否有可用图像
            if self.latest_image is None:
                rospy.logerr("未收到相机图像")
                return response
            
            # 获取原始图像尺寸
            cv_image = self.latest_image.copy()
            orig_height, orig_width = cv_image.shape[:2]
            
            # 预处理图像
            input_width = self.params.get('input_width', 480)
            input_height = self.params.get('input_height', 480)
            input_image = cv2.resize(cv_image, (input_width, input_height))
            input_image = input_image.astype(np.float32) / 255.0
            input_image = np.transpose(input_image, (2, 0, 1))
            input_image = np.expand_dims(input_image, axis=0)
            
            # 运行推理
            outputs = self.ort_session.run(None, {self.input_name: input_image})
            detection_result = outputs[0]  # 形状 [1, 6, N]
            rospy.loginfo(f"检测结果形状: {detection_result.shape}")
            
            # 处理检测结果
            confidence_threshold = self.params.get('confidence_threshold', 0.5)
            detections = detection_result[0]  # 形状 [6, N]
            
            # 检查是否有火焰或灭火器
            for i in range(detections.shape[1]):
                x_center, y_center, w, h, conf_extinguisher, conf_flame = detections[:, i]
                if conf_flame > confidence_threshold:
                    response.is_flame_detected = True
                    rospy.loginfo(f"检测到火焰，置信度: {conf_flame:.2f}")
                if conf_extinguisher > confidence_threshold:
                    response.is_extinguisher_detected = True
                    rospy.loginfo(f"检测到灭火器，置信度: {conf_extinguisher:.2f}")
            
            if not (response.is_flame_detected or response.is_extinguisher_detected):
                rospy.loginfo("未检测到火焰或灭火器")
            
            return response
            
        except Exception as e:
            rospy.logerr(f"服务处理错误: {e}")
            return response
    
    def run(self):
        rospy.spin()

if __name__ == '__main__':
    try:
        node = FlameDetectorService()
        node.run()
    except rospy.ROSInterruptException:
        pass