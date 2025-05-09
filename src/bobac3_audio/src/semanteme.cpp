#include <ros/ros.h>
#include <robot_audio/robot_semanteme.h>
#include <string>


int main(int argc, char** argv)
{
    ros::init(argc, argv, "semanteme");
    ros::NodeHandle n;
    //定义“audio_semanteme”客户端
    ros::ServiceClient client = n.serviceClient<robot_audio::robot_semanteme>("voice_aiui");
    //等待服务开启
    ros::service::waitForService("voice_aiui");
    //创建服务实例
    robot_audio::robot_semanteme srv;
    srv.request.mode = 1;
    srv.request.textorpath = "今天天气怎么样";
    //srv.request.textorpath = "带我去卧室";
    // srv.request.textorpath = "前进0.2米";
    std::cout<<"问题："<< srv.request.textorpath<<std::endl;
    client.call(srv);
    
    //系统技能
    if(srv.response.tech == "system"){
        std::cout<<"回答："<< srv.response.anwser<<std::endl;
    //用户自定义技能
    }else if(srv.response.tech == "user"){
        //导航意图
        if(srv.response.intent == "robot_nav"){
            //打印消息
            std::cout<<srv.response.slots_name[0]<<":"<<srv.response.slots_value[0]
            <<"\n"<<srv.response.slots_name[1]<<":"<<srv.response.slots_value[1]<<std::endl;
        //控制意图
        }else if(srv.response.intent == "robot_control"){
            //打印消息
            std::cout<<srv.response.slots_name[0]<<":"<<srv.response.slots_value[0]
            <<"\n"<<srv.response.slots_name[1]<<":"<<srv.response.slots_value[1]
            <<"\n"<<srv.response.slots_name[2]<<":"<<srv.response.slots_value[2]<<std::endl;
        }
        std::cout<<"回答："<< srv.response.anwser<<std::endl;
    }
    return 0;
}

