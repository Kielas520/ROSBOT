#include "ros/ros.h"
#include "robot_audio/robot_iat.h"
#include "robot_audio/robot_semanteme.h"
#include "robot_audio/robot_tts.h"
#include <cstdlib>
using namespace std;
int main(int argc, char **argv)
{
  ros::init(argc, argv, "audio_test_client");

  ros::NodeHandle nh;
  ros::ServiceClient iat_client = nh.serviceClient<robot_audio::robot_iat>("audio_iat");
  ros::ServiceClient tts_client = nh.serviceClient<robot_audio::robot_tts>("audio_tts");
  ros::ServiceClient semanteme_client = nh.serviceClient<robot_audio::robot_semanteme>("audio_semanteme");

  string tts_audio_path;


  ros::service::waitForService("audio_iat");
  ros::service::waitForService("audio_tts");
  ros::service::waitForService("audio_semanteme");

  robot_audio::robot_tts tts_data;
  tts_data.request.text = "左转90度";
  if(tts_client.call(tts_data))
  {
    tts_audio_path = tts_data.response.audiopath;
    string commad = "aplay "+tts_audio_path;
    system(commad.c_str());
  }

  robot_audio::robot_semanteme semanteme_data;
  semanteme_data.request.mode = 1;
  semanteme_data.request.textorpath = "深圳天气怎么样？";
  if(semanteme_client.call(semanteme_data))
  {
    //ROS_INFO(semanteme_data.response.anwser.c_str());
    cout<<semanteme_data.response.anwser<<endl;
  }
  semanteme_data.request.mode = 1;
  semanteme_data.request.textorpath = "导航到后台";
  if(semanteme_client.call(semanteme_data))
  {
    //ROS_INFO(semanteme_data.response.anwser.c_str());
    cout<<semanteme_data.response.anwser<<endl;
    cout<<semanteme_data.response.iat<<endl;
    for (int var = 0; var < semanteme_data.response.slots_name.size(); ++var)
    {
      cout<<semanteme_data.response.slots_name[var]<<": "<<semanteme_data.response.slots_value[var]<<endl;
    }
  }
  
  semanteme_data.request.mode = 2;
  semanteme_data.request.textorpath = tts_audio_path;
  if(semanteme_client.call(semanteme_data))
  {
    //ROS_INFO(semanteme_data.response.anwser.c_str());
    cout<<semanteme_data.response.anwser<<endl;
    cout<<semanteme_data.response.iat<<endl;
    for (int var = 0; var < semanteme_data.response.slots_name.size(); ++var)
    {
      cout<<semanteme_data.response.slots_name[var]<<": "<<semanteme_data.response.slots_value[var]<<endl;
    }
  }

  robot_audio::robot_iat iat_data;
  iat_data.request.audiopath = tts_audio_path;
  if(iat_client.call(iat_data))
  {
    //ROS_INFO(tts_data.response.anwser.c_str());
    cout<<iat_data.response.text<<endl;
  }
  return 0;
}
