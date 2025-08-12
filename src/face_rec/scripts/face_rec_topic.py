#! /usr/bin/env python
# -*- coding: utf-8 -*

import os
import cv2
import numpy as np
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import face_recognition
from face_rec.msg import face_data, face_results
import PIL
from PIL import ImageFont,ImageDraw

class Face_Rec():
    def __init__(self):
        """初始化所有参数"""
        rospy.init_node("face_rec_topic") # 初始化节点
        

        self.known_face_encodings = list()
        self.known_face_names = list()
        self.tolerance = rospy.get_param('~tolerance', '')  # 人脸比对容差值
        self.face_data = rospy.get_param('~face_data', '') # 人脸图片目录
        self.face_load()
        self.pub_data = rospy.Publisher("/face_results", face_results, queue_size=10) # 发布人脸数据
        self.pub_img = rospy.Publisher("/camera/face_recognition", Image, queue_size=10) # 设置发布话题名、类型、设置队列个数       
        self.sub_img = rospy.Subscriber("/head_cam/image_raw",Image,self.image_callback) # 订阅摄像头节点
        rospy.spin()
        
    def image_callback(self, image):
        
        bridgr = CvBridge()
        # 将消息转为bgr格式
        frame = bridgr.imgmsg_to_cv2(image,'bgr8')
        face_locations = [] # 检测到的未知人脸列表
        face_encodings = [] # 未知人脸编码列表
        face_names = [] # 实时标签列表列表
        process_this_frame = True 
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
                matches = face_recognition.compare_faces(self.known_face_encodings, face_encoding,self.tolerance)
                # 得到误差最小的人脸在已知列表中的位置
                best_match_index = np.argmin(face_distances)
                if matches[best_match_index]: # 如果对比结果为True
                    name = self.known_face_names[best_match_index] # 为检测到的人脸做标签
                face_names.append(name)

        process_this_frame = not process_this_frame

        # 定义发布消息
        results = face_results()
        results.num = len(face_names)

        for (top, right, bottom, left), name in zip(face_locations, face_names):
            # 在面部画一个框，放大备份人脸位置，因为我们检测到的帧被缩放到1/4大小
            top *= 4
            right *=4
            bottom *=4
            left *=4
            cv2.rectangle(frame, (left,top),(right,bottom),(0,0,255),2)
            # 在人脸下方写上标签
            cv2.rectangle(frame, (left, bottom - 35), (right, bottom), (0, 0, 255), cv2.FILLED)
            font = cv2.FONT_HERSHEY_DUPLEX
            # cv2.putText(frame,name,(left - 10, bottom - 10), font, 1.0,(255,255,255), 1)
            frame = self.paint_chinese_opencv(frame, name, (left + 6, bottom - 40), (255,255,255))

            # 定义发布消息
            data = face_data()
            data.name = name
            data.xmin = left
            data.xmax = right
            data.ymin = top
            data.ymax = bottom
            results.face_data.append(data)

        img = bridgr.cv2_to_imgmsg(frame,"bgr8") # 把OpenCV图像转换为ROS消息
        self.pub_data.publish(results)
        self.pub_img.publish(img) # 发布图像到话题


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

    def paint_chinese_opencv(self,im,chinese,pos,color):
        img_PIL = PIL.Image.fromarray(cv2.cvtColor(im,cv2.COLOR_BGR2RGB))
        font = ImageFont.truetype('NotoSansCJK-Bold.ttc',30)
        fillColor = color #(255,0,0)
        position = pos #(100,100)
        if not isinstance(chinese,unicode):
            chinese = chinese.decode('utf-8')
        draw = ImageDraw.Draw(img_PIL)
        draw.text(position,chinese,font=font,fill=fillColor)
    
        img = cv2.cvtColor(np.asarray(img_PIL),cv2.COLOR_RGB2BGR)
        return img


if __name__=="__main__":
    Face_Rec()
