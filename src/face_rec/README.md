---
title: face_rec功能包说明
date: 2023-07-24 09:46
summary: 基于ros和face_recognition实现的人脸识别功能包。
tags:
  - ros
  - 人脸识别
---


## 环境依赖：
```bash
pip install dlib==19.19.0
pip install face_recognition
```
## 使用说明：
当需要添加新的人脸识别库时，只需要在face_data目录下创建一个新的目录，并将其命名为该人脸的类别名。并且向库中添加一个或多个同类别人脸样本。
## 消息定义：
face_data.msg
```yaml
# 标签
string name 
# 人脸框数据
float64 xmin 
float64 xmax
float64 ymin
float64 ymax
```
face_results.msg

```yaml
uint8 num # 识别到的人脸数量
face_rec/face_data[] face_data # 人脸数据
```

## 服务定义
recognition_results.srv
```yaml
int8 mode # 识别模式，mode=1：识别相机画面；mode=2：识别图片
string image_path # 模式2下图片路径
---
face_rec/face_results result #　识别结果
bool success # 服务调用成功
```

## face_rec_service.py节点
### ros parm:
参数设置
- face_data:人脸数据库目录
### ros API：
服务
- /face_recognition_results(face_rec/):识别相机或者图像中的人脸

## face_rec_topic.py节点
### ros parm:
参数设置
- face_data:人脸数据库目录

### ros API：
订阅话题
- /usb_cam/image_raw(sensor_msgs/Image):相机原始画面

发布话题
- /camera/face_recognition(sensor_msgs/Image):相机人脸识别结果框选及标注画面
- /usb_cam/image_raw(face_rec/face_results):识别人脸的标签及边界信息


