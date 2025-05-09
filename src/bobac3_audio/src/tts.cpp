#include <ros/ros.h>
#include <robot_audio/robot_tts.h>

int main(int argc, char * argv[])
{
    ros::init(argc, argv, "tts_node");
    ros::NodeHandle n;
    ros::ServiceClient tts_client = n.serviceClient<robot_audio::robot_tts>("voice_tts");
    ros::service::waitForService("voice_tts");
    robot_audio::robot_tts tts_srv;
    tts_srv.request.text = "生活不止眼前的苟且，还有诗和远方的田野";
    tts_client.call(tts_srv);
    std::string dir = "play "+tts_srv.response.audiopath; //编辑为系统指令
    system(dir.c_str()); //播放音频文件
    return 0;
}

