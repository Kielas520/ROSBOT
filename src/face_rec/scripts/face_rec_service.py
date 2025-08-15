#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import cv2
import numpy as np
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import face_recognition
from face_rec.srv import recognition_results, recognition_resultsResponse
from face_rec.msg import face_data, face_results
import PIL
from PIL import ImageFont, ImageDraw

class Face_Rec:
    def __init__(self):
        """初始化所有参数"""
        rospy.init_node("face_rec_service", anonymous=True)  # 初始化节点

        # 工作空间根目录
        workspace_dir = os.path.expanduser('~/ros_workspace')

        self.known_face_encodings = list()
        self.known_face_names = list()
        
        # 优先检查环境变量 FACE_DATA_DIRECTORY
        face_data_env = os.getenv('FACE_DATA_DIRECTORY')
        if face_data_env and os.path.exists(face_data_env):
            self.face_data = face_data_env
            rospy.loginfo(f"使用环境变量路径: {self.face_data}")
        else:
            # 回退到 ROS 参数或默认路径
            self.face_data = rospy.get_param('~face_data', os.path.join(workspace_dir, 'face_data'))
            rospy.loginfo(f"环境变量无效或未设置，使用 ROS 参数路径: {self.face_data}")
        
        # 确保 face_data 目录存在
        if not os.path.exists(self.face_data):
            rospy.logerr(f"人脸数据目录不存在: {self.face_data}")
            raise rospy.ROSException(f"人脸数据目录不存在: {self.face_data}")
        
        # 初始化 tolerance 参数
        self.tolerance = rospy.get_param('~tolerance', 0.6)  # 人脸比对容差值，默认 0.6
        rospy.loginfo(f"人脸比对容差值: {self.tolerance}")

        self.face_load()

        # 初始化 CvBridge
        self.bridge = CvBridge()

        # 创建服务
        self.face_recsrv = rospy.Service('face_recognition_results', recognition_results, self.detect_callback)

        # 创建图像发布者
        self.image_pub = rospy.Publisher('/camera/face_recognition', Image, queue_size=10)

        # 确保保存目录存在
        self.save_dir = os.path.join(workspace_dir, 'photos')
        os.makedirs(self.save_dir, exist_ok=True)

        rospy.loginfo("人脸识别服务已启动")
        rospy.spin()

    def detect_callback(self, req):
        results = face_results()
        if req.mode == 1:
            # 从摄像头话题获取图像
            try:
                image = rospy.wait_for_message("/usb_camera_node/head_image_raw", Image, timeout=5.0)
                frame = self.bridge.imgmsg_to_cv2(image, 'bgr8')
                return self.generate_srv(frame)
            except rospy.ROSException as e:
                rospy.logerr(f"无法获取摄像头图像: {e}")
                return recognition_resultsResponse(results, False)
        elif req.mode == 2:
            # 从指定路径加载图像
            frame = cv2.imread(req.image_path, 1)
            if frame is None:
                rospy.logerr(f"无法加载图像: {req.image_path}")
                return recognition_resultsResponse(results, False)
            return self.generate_srv(frame)
        else:
            rospy.logerr(f"无效的模式: {req.mode}")
            return recognition_resultsResponse(results, False)

    def generate_srv(self, frame):
        rospy.loginfo('-----------------------------------------------')
        rospy.loginfo('开始检测')

        face_locations = []  # 检测到的未知人脸列表
        face_encodings = []  # 未知人脸编码列表
        face_names = []  # 实时标签列表
        process_this_frame = True
        results = face_results()

        # 将视频帧大小调整为1/4以加快处理速度
        small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)
        # 将图像从 BGR（OpenCV）转换为 RGB（face_recognition）
        rgb_small_frame = cv2.cvtColor(small_frame, cv2.COLOR_BGR2RGB)

        if process_this_frame:
            # 查找当前视频帧中的所有人脸
            face_locations = face_recognition.face_locations(rgb_small_frame)
            # 编码检测到的人脸
            face_encodings = face_recognition.face_encodings(rgb_small_frame, face_locations)
            face_names = []
            rospy.loginfo(f"检测到的人脸数: {len(face_encodings)}")
            for face_encoding in face_encodings:
                # 将检测到的人脸与已知人脸库比较
                name = "Unknown"
                # 计算人脸误差
                face_distances = face_recognition.face_distance(self.known_face_encodings, face_encoding)
                matches = face_recognition.compare_faces(self.known_face_encodings, face_encoding, self.tolerance)
                # 找到误差最小的人脸
                if len(face_distances) > 0:
                    best_match_index = np.argmin(face_distances)
                    if matches[best_match_index]:
                        name = self.known_face_names[best_match_index]
                face_names.append(name)

        process_this_frame = not process_this_frame

        # 绘制检测结果
        annotated_image = frame.copy()
        results.num = len(face_names)
        for (top, right, bottom, left), name in zip(face_locations, face_names):
            # 放大回原始尺寸（因检测时缩放到1/4）
            top *= 4
            right *= 4
            bottom *= 4
            left *= 4
            # 绘制人脸框
            cv2.rectangle(annotated_image, (left, top), (right, bottom), (0, 0, 255), 2)
            # 绘制标签背景
            cv2.rectangle(annotated_image, (left, bottom - 35), (right, bottom), (0, 0, 255), cv2.FILLED)
            # 绘制中文标签
            annotated_image = self.paint_chinese_opencv(annotated_image, name, (left + 6, bottom - 40), (255, 255, 255))

            # 填充发布消息
            data = face_data()
            data.name = name
            data.xmin = left
            data.xmax = right
            data.ymin = top
            data.ymax = bottom
            rospy.loginfo(f"检测到: {name}")
            results.face_data.append(data)

        # 保存带注释的图像（仅当检测到人脸时）
        if face_names:
            try:
                save_path = self.generate_unique_filename(face_names)
                if not os.path.exists(save_path):  # 仅当文件不存在时保存
                    cv2.imwrite(save_path, annotated_image)
                    rospy.loginfo(f"已保存带检测结果的图像到 {save_path}")
                else:
                    rospy.loginfo(f"图像 {save_path} 已存在，跳过保存")
            except Exception as e:
                rospy.logerr(f"保存图像失败: {e}")

        # 发布带注释的图像
        try:
            img_msg = self.bridge.cv2_to_imgmsg(annotated_image, encoding="bgr8")
            self.image_pub.publish(img_msg)
            rospy.loginfo("已发布带检测结果的图像到 /camera/face_recognition 话题")
        except Exception as e:
            rospy.logerr(f"发布图像失败: {e}")

        rospy.loginfo('-----------------------------------------------')
        return recognition_resultsResponse(results, True)

    def face_load(self):
        """加载图像并学习如何识别，添加到已知人脸库"""
        try:
            for name in os.listdir(self.face_data):
                rospy.loginfo(f"添加 '{name}' 的人脸数据")
                file = os.path.join(self.face_data, name)
                if not os.path.isdir(file):
                    continue
                for img in os.listdir(file):
                    img_path = os.path.join(file, img)
                    new_image = face_recognition.load_image_file(img_path)
                    face_encodings = face_recognition.face_encodings(new_image)
                    if face_encodings:  # 确保图像中包含人脸
                        self.known_face_encodings.append(face_encodings[0])
                        self.known_face_names.append(name)
                    else:
                        rospy.logwarn(f"图像 {img_path} 中未检测到人脸，跳过")
        except Exception as e:
            rospy.logerr(f"加载人脸数据失败: {e}")
            raise

    def paint_chinese_opencv(self, im, chinese, pos, color):
        """在图像上绘制中文标签"""
        try:
            img_PIL = PIL.Image.fromarray(cv2.cvtColor(im, cv2.COLOR_BGR2RGB))
            font = ImageFont.truetype('NotoSansCJK-Bold.ttc', 30)
            fillColor = color
            position = pos
            draw = ImageDraw.Draw(img_PIL)
            draw.text(position, chinese, font=font, fill=fillColor)
            img = cv2.cvtColor(np.asarray(img_PIL), cv2.COLOR_RGB2BGR)
            return img
        except Exception as e:
            rospy.logerr(f"绘制中文标签失败: {e}")
            return im

    def generate_unique_filename(self, face_names):
        """生成基于人名的唯一文件名"""
        known_names = [name for name in face_names if name != "Unknown"]
        if known_names:
            base_name = '_'.join(sorted(set(known_names)))
        else:
            base_name = "Unknown"
        return os.path.join(self.save_dir, f"{base_name}.jpg")

if __name__ == "__main__":
    try:
        face_rec = Face_Rec()
    except rospy.ROSInterruptException:
        pass