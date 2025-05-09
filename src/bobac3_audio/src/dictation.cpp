#include <ros/ros.h>
#include <robot_audio/robot_iat.h>
#include <robot_audio/Collect.h>
#include <string>

int main(int argc, char ** argv)
{
    ros::init(argc, argv, "dictation");
    ros::NodeHandle n;
    ros::ServiceClient iat_client = n.serviceClient<robot_audio::robot_iat>("voice_iat");
    ros::ServiceClient collect_client = n.serviceClient<robot_audio::Collect>("voice_collect");
    
    robot_audio::Collect coll_srv; //创建语音采集服务实例
    coll_srv.request.collect_flag = 1; //定义请求
    ros::service::waitForService("voice_collect");
    collect_client.call(coll_srv);
    std::cout<<"语音采集结束："<<coll_srv.response.voice_filename<<std::endl;

    robot_audio::robot_iat iat_srv; //创建语音听写服务实例
    iat_srv.request.audiopath = coll_srv.response.voice_filename;
    ros::service::waitForService("voice_iat");
    iat_client.call(iat_srv);

    std::cout<< "听到的内容：" << iat_srv.response.text <<std::endl;
    return 0;
}

