#include"ros/ros.h"//包含ROS头文件
#include"geometry_msgs/Twist.h"//包含速度信息消息头文件
main(int argc,char **argv)
{
  ros::init(argc,argv,"robot_control");//ros初始化，其中robot_control参数指定了该节点运行之后在系统中的名称
  ros::NodeHandle n;//定义ROS句柄
  ros::Publisher Vel_c;//定义一个话题发布器，用于发布机器人的运动速度
  Vel_c = n.advertise<geometry_msgs::Twist>("cmd_vel",10);//初始化话题发布器
  geometry_msgs::Twist vel_msg;//定义1个速度变量，用于指定要控制的机器人速度
  usleep(1000*1000*2);//控制机器人以0.05m/s的速度向前运行2S
  vel_msg.linear.x=0.05;
  vel_msg.angular.z=0.0;
  Vel_c.publish(vel_msg);//发布速度
  usleep(1000*1000*2);//控制机器人以0.05m/s的速度向前运行2S

  vel_msg.linear.x=0.0;
  vel_msg.angular.z=0.78;//指定机器人以停止运动，原地以0.78rad/s运行(45°/s);
  Vel_c.publish(vel_msg);//发布该控制速度
  usleep(1000*1000*2);//休眠2s，机器人以上述速度运行2s

  vel_msg.linear.x=0.0;
  vel_msg.angular.z=0.0;//机器人停止运动
  Vel_c.publish(vel_msg);//发布该控制速度
  usleep(1000*1000*2);//休眠2s，机器人以上述速度运行2s
  return 0;
}

