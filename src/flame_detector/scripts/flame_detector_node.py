#!/usr/bin/env python
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
        
        # 加载args.yaml
        config_path = os.path.join(os.path.dirname(__file__), '../config/args.yaml')
        with open(config_path, 'r') as f:
            self.params = yaml.safe_load(f)
        
        # 初始化ONNX模型
        model_path = os.path.join(os.path.dirname(__file__), '../models/flame_model.onnx')
        self.ort_session = ort.InferenceSession(model_path)
        self.input_name = self.ort_session.get_inputs()[0].name
        
        # 初始化CvBridge
        self.bridge = CvBridge()
        
        # 订阅相机话题
        camera_topic = self.params.get('camera_topic', '/bottom_camera/image_raw')
        rospy.Subscriber(camera_topic, Image, self.image_callback)
        
        rospy.loginfo("Flame Detector Node started.")
    
    def image_callback(self, msg):
        cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
        
        # 预处理图像
        input_image = cv2.resize(cv_image, (self.params.get('input_width', 224), self.params.get('input_height', 224)))
        input_image = input_image.astype(np.float32) / 255.0
        input_image = np.transpose(input_image, (2, 0, 1))
        input_image = np.expand_dims(input_image, axis=0)
        
        # 运行推理
        outputs = self.ort_session.run(None, {self.input_name: input_image})
        detection_result = outputs[0]
        rospy.loginfo(f"Detection result: {detection_result}")
        
        # 示例：检测到火苗或灭火器
        if detection_result.max() > self.params.get('confidence_threshold', 0.5):
            rospy.logwarn("Flame or extinguisher detected!")
    
    def run(self):
        rospy.spin()

if __name__ == '__main__':
    try:
        node = FlameDetectorNode()
        node.run()
    except rospy.ROSInterruptException:
        pass