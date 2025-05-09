#include <ros/ros.h>
#include <robot_audio/Collect.h>
#include <iostream>
#include <string>

int main(int argc,char** argv)
{
    ros::init(argc,argv,"collect"); //初始化节点
    ros::NodeHandle n; //节点句柄
    ros::ServiceClient collect_client = n.serviceClient<robot_audio::Collect>("voice_collect"); //定义客户端
    robot_audio::Collect srv; //定义一个消息
    srv.request.collect_flag = 1;
    ros::service::waitForService("voice_collect"); //等待服务开启
    collect_client.call(srv); //发送消息
    ROS_INFO("File saved in : %s",srv.response.voice_filename.c_str());
    std::string dir = "play "+srv.response.voice_filename; //编辑为系统指令
    sleep(1);
    system(dir.c_str()); //播放音频文件
}

