#! /usr/bin/env python
# -*- coding: utf-8 -*

import os
import cv2
import numpy as np
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import face_recognition
from face_rec.srv import *
from face_rec.msg import face_data,face_results
import PIL
from PIL import ImageFont,ImageDraw

class Face_Rec():
    def __init__(self):
        """初始化所有参数"""
        rospy.init_node("face_rec_service") # 初始化节点
        self.known_face_encodings = list()
        self.known_face_names = list()
        self.face_data = rospy.get_param('~face_data', '') # 人脸图片目录
        self.tolerance = rospy.get_param('~tolerance', '')  # 人脸比对容差值
        self.face_load()
        self.face_recsrv = rospy.Service('face_recognition_results', recognition_results,self.detect_callback) 
        rospy.spin()

    def detect_callback(self, req):
        results = face_results()
        if req.mode == 1:
            bridgr = CvBridge()
            # 将消息转为bgr格式
            image = rospy.wait_for_message("/head_cam/image_raw",Image)
            frame = bridgr.imgmsg_to_cv2(image,'bgr8')
            return self.generate_srv(frame)
        elif req.mode ==2:
            print(req.image_path)
            frame = cv2.imread(req.image_path,1)
            if(frame.date==None):
                return recognition_resultsResponse(results,False)
            else:  
                return self.generate_srv(frame)
        else:
            return recognition_resultsResponse(results,False)
    
    def generate_srv(self,frame):
        print('-----------------------------------------------')
        print('开始检测')
        
        face_locations = [] # 检测到的未知人脸列表
        face_encodings = [] # 未知人脸编码列表
        face_names = [] # 实时标签列表列表
        process_this_frame = True 
        results = face_results()
        # 将视频帧大小调整为1/4大小，以加快人脸识别处理速度
        small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)
        # 将图像从 BGR 颜色（OpenCV 使用）转换为 RGB 颜色（face_recognition使用）
        rgb_small_frame = cv2.cvtColor(small_frame, cv2.COLOR_BGR2RGB)
        if process_this_frame == True: # 间隔
            # 查找当前视频帧中的所有人脸
            face_locations = face_recognition.face_locations(rgb_small_frame)       
            # 把查找到人脸进行编码
            face_encodings = face_recognition.face_encodings(rgb_small_frame,face_locations)
            face_names = []
            rospy.loginfo("检测到的人脸数:%s",len(face_encodings))
            for face_encoding in face_encodings:
                # 将检测到的人脸和已知人脸库中的图片比较
                name = "Unknown"
                # 计算检测到的人脸和已知人脸的误差
                face_distances = face_recognition.face_distance(self.known_face_encodings,face_encoding)
                matches = face_recognition.compare_faces(self.known_face_encodings, face_encoding)
                # 得到误差最小的人脸在已知列表中的位置
                best_match_index = np.argmin(face_distances)
                matches = face_recognition.compare_faces(self.known_face_encodings, face_encoding,self.tolerance)
                if matches[best_match_index]: # 如果对比结果为True
                    name = self.known_face_names[best_match_index] # 为检测到的人脸做标签
                face_names.append(name)

        process_this_frame = not process_this_frame
            
        results.num = len(face_names)
        
        
        for (top, right, bottom, left), name in zip(face_locations, face_names):
            # 在面部画一个框，放大备份人脸位置，因为我们检测到的帧被缩放到1/4大小
            data = face_data()
            data.name = name
            data.xmin = left*4
            data.xmax = right*4
            data.ymin = top*4
            data.ymax = bottom*4
            rospy.loginfo("检测到:%s",name)
            results.face_data.append(data)
        print('-----------------------------------------------')
        return recognition_resultsResponse(results,True)


    def face_load(self):
        """加载图像并学习如何识别它，并添加到已知人脸库"""
        for name in os.listdir(self.face_data):
            rospy.loginfo("添加'%s'的人脸数据",name)
            file = os.path.join(self.face_data,name)
            for img in os.listdir(file):
                new_image = face_recognition.load_image_file(os.path.join(file,img)) # 将图片转换为numpy数组
                new_face_encoding = face_recognition.face_encodings(new_image)[0] # 得到人脸编码
                self.known_face_encodings.append(new_face_encoding) # 添加到已知人脸库
                self.known_face_names.append(name) # 添加人脸名称

if __name__=="__main__":
    Face_Rec()
