#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>

int main(int argc, char** argv) {
    // 初始化 ROS 节点，命名为 "usb_camera_node"
    ros::init(argc, argv, "usb_camera_node");
    // 使用私有节点句柄，便于参数管理
    ros::NodeHandle nh("~");

    // 初始化 image_transport 用于发布图像话题
    image_transport::ImageTransport it(nh);
    // 创建发布者，发布到 "head_image_raw" 话题，队列大小为 1
    image_transport::Publisher pub = it.advertise("head_image_raw", 1);

    // 从参数服务器读取相机参数
    int frame_width, frame_height, frame_rate;
    std::string fourcc;
    nh.param("frame_width", frame_width, 640);    // 默认宽度 640
    nh.param("frame_height", frame_height, 480);  // 默认高度 480
    nh.param("frame_rate", frame_rate, 30);       // 默认发布频率 30Hz
    nh.param<std::string>("fourcc", fourcc, "MJPG"); // 默认格式 MJPG

    // 枚举相机索引以找到可用相机
    int camera_index = 0;
    cv::VideoCapture cap;
    bool camera_found = false;
    // 循环尝试打开相机，最大索引设为 10 避免无限循环
    while (camera_index < 10) {
        cap.open(camera_index, cv::CAP_V4L2); // 使用 V4L2 后端以支持 MJPG
        if (cap.isOpened()) {
            camera_found = true;
            // 成功打开相机，打印索引信息
            ROS_INFO("Successfully opened camera at index: %d", camera_index);
            break;
        }
        camera_index++;
    }

    // 如果没有找到可用相机，打印错误信息并退出
    if (!camera_found) {
        ROS_ERROR("No USB camera found after enumerating indices");
        return -1;
    }

    // 设置相机参数：分辨率，MJPG 格式，无帧率上限
    if (fourcc.length() == 4) {
        cap.set(cv::CAP_PROP_FOURCC, cv::VideoWriter::fourcc(fourcc[0], fourcc[1], fourcc[2], fourcc[3]));
    } else {
        ROS_WARN("Invalid FOURCC code '%s', using default MJPG", fourcc.c_str());
        cap.set(cv::CAP_PROP_FOURCC, cv::VideoWriter::fourcc('M', 'J', 'P', 'G'));
    }
    cap.set(cv::CAP_PROP_FRAME_WIDTH, frame_width);   // 设置宽度
    cap.set(cv::CAP_PROP_FRAME_HEIGHT, frame_height); // 设置高度
    // 不设置 CAP_PROP_FPS，以允许相机使用最大帧率

    // 设置发布频率
    ros::Rate loop_rate(frame_rate);

    // 主循环，持续捕获并发布图像
    while (ros::ok()) {
        cv::Mat frame;
        // 从相机捕获一帧图像
        cap >> frame;

        // 检查图像是否为空
        if (frame.empty()) {
            ROS_WARN("Captured empty frame, skipping...");
            continue;
        }

        // 将 OpenCV 图像转换为 ROS 图像消息
        sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), sensor_msgs::image_encodings::BGR8, frame).toImageMsg();
        // 设置消息的时间戳
        msg->header.stamp = ros::Time::now();

        // 发布图像消息
        pub.publish(msg);

        // 处理回调并控制循环频率
        ros::spinOnce();
        loop_rate.sleep();
    }

    // 释放相机资源
    cap.release();
    return 0;
}
