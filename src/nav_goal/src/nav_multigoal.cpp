#include"ros/ros.h"//包含ROS头文件  
#include <move_base_msgs/MoveBaseAction.h>//包含move_base action头文件  
#include <actionlib/client/simple_action_client.h>//包含simple_aciton客户端头文件  

main(int argc,char** argv)  
{   
  ros::init(argc,argv,"nav_goal");  
  ros::NodeHandle nh;  
  actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> ac("move_base",true);//定义一个acition客户端  
  ac.waitForServer();//等待服务开启 
  move_base_msgs::MoveBaseGoal goal1_pre;//定义第一个目标点 北京馆 
  goal1_pre.target_pose.header.frame_id = "map";  
  goal1_pre.target_pose.header.stamp = ros::Time::now();  
  goal1_pre.target_pose.pose.position.x = 2.28;//目标点x 
  goal1_pre.target_pose.pose.position.y = 0.13;//目标点y  
  goal1_pre.target_pose.pose.orientation.z = 0.03;
  goal1_pre.target_pose.pose.orientation.w = 0.99;//目标点姿态四元数表示 
  move_base_msgs::MoveBaseGoal goal1;//定义第一个目标点 北京馆 
  goal1.target_pose.header.frame_id = "map";  
  goal1.target_pose.header.stamp = ros::Time::now();  
  goal1.target_pose.pose.position.x = 2.48;//目标点x 
  goal1.target_pose.pose.position.y = 0.13;//目标点y  
  goal1.target_pose.pose.orientation.z = 0.03;
  goal1.target_pose.pose.orientation.w = 0.99;//目标点姿态四元数表示

  move_base_msgs::MoveBaseGoal goal2_pre;//定义第二个目标点 ，广州馆 
  goal2_pre.target_pose.header.frame_id = "map";  
  goal2_pre.target_pose.header.stamp = ros::Time::now();  
  goal2_pre.target_pose.pose.position.x = 2.28;//目标点x  
  goal2_pre.target_pose.pose.position.y = 1.077; //目标点y  
  goal2_pre.target_pose.pose.orientation.z = -0.026;  
  goal2_pre.target_pose.pose.orientation.w = 1.000;//目标点姿态四元数表示  
  move_base_msgs::MoveBaseGoal goal2;//定义第二个目标点 ，广州馆 
  goal2.target_pose.header.frame_id = "map";  
  goal2.target_pose.header.stamp = ros::Time::now();  
  goal2.target_pose.pose.position.x = 2.48;//目标点x  
  goal2.target_pose.pose.position.y = 1.077; //目标点y  
  goal2.target_pose.pose.orientation.z = -0.026;  
  goal2.target_pose.pose.orientation.w = 1.000;//目标点姿态四元数表示  

  move_base_msgs::MoveBaseGoal goal3_pre;//定义第三个目标点 ，吉林馆 
  goal3_pre.target_pose.header.frame_id = "map";  
  goal3_pre.target_pose.header.stamp = ros::Time::now();  
  goal3_pre.target_pose.pose.position.x = 2.28;//目标点x  
  goal3_pre.target_pose.pose.position.y = 2.120;    //目标点y  
  goal3_pre.target_pose.pose.orientation.z = -0.032;  
  goal3_pre.target_pose.pose.orientation.w = 0.999;//目标点姿态四元数表示
  move_base_msgs::MoveBaseGoal goal3;//定义第三个目标点 ，吉林馆 
  goal3.target_pose.header.frame_id = "map";  
  goal3.target_pose.header.stamp = ros::Time::now();  
  goal3.target_pose.pose.position.x = 2.48;//目标点x  
  goal3.target_pose.pose.position.y = 2.120;    //目标点y  
  goal3.target_pose.pose.orientation.z = -0.032;  
  goal3.target_pose.pose.orientation.w = 0.999;//目标点姿态四元数表示  
  

  move_base_msgs::MoveBaseGoal goal4_pre;//定义第四个目标点 ，深圳馆 
  goal4_pre.target_pose.header.frame_id = "map";  
  goal4_pre.target_pose.header.stamp = ros::Time::now();  
  goal4_pre.target_pose.pose.position.x =0.826;//目标点x  
  goal4_pre.target_pose.pose.position.y = 1.109;    //目标点y  
  goal4_pre.target_pose.pose.orientation.z = -0.012;  
  goal4_pre.target_pose.pose.orientation.w = 1.000;//目标点姿态四元数表示
  move_base_msgs::MoveBaseGoal goal4;//定义第四个目标点 ，深圳馆 
  goal4.target_pose.header.frame_id = "map";  
  goal4.target_pose.header.stamp = ros::Time::now();  
  goal4.target_pose.pose.position.x =1.026;//目标点x  
  goal4.target_pose.pose.position.y = 1.109;    //目标点y  
  goal4.target_pose.pose.orientation.z = -0.012;  
  goal4.target_pose.pose.orientation.w = 1.000;//目标点姿态四元数表示

 move_base_msgs::MoveBaseGoal goal5_pre;//定义第五个目标点 ，上海馆 
 goal5_pre.target_pose.header.frame_id = "map";  
 goal5_pre.target_pose.header.stamp = ros::Time::now();  
 goal5_pre.target_pose.pose.position.x =0.873;//目标点x  
 goal5_pre.target_pose.pose.position.y = 2.120;    //目标点y  
 goal5_pre.target_pose.pose.orientation.z =0.013;  
 goal5_pre.target_pose.pose.orientation.w = 1.000;//目标点姿态四元数表示
 move_base_msgs::MoveBaseGoal goal5;//定义第五个目标点 ，上海馆 
 goal5.target_pose.header.frame_id = "map";  
 goal5.target_pose.header.stamp = ros::Time::now();  
 goal5.target_pose.pose.position.x =1.073;//目标点x  
 goal5.target_pose.pose.position.y = 2.120;    //目标点y  
 goal5.target_pose.pose.orientation.z =0.013;  
 goal5.target_pose.pose.orientation.w = 1.000;//目标点姿态四元数表示

  int Num = 2;//定义巡检的圈数  
  for(int i=0;i<Num;i++)  
{  
  ac.sendGoal(goal1_pre);  
  while(!(ac.getState()==actionlib::SimpleClientGoalState::SUCCEEDED))  
    {  
       usleep(1000*20);  
    }  
   ROS_INFO("机器人到达目标点1");  
  ac.sendGoal(goal1);  
  while(!(ac.getState()==actionlib::SimpleClientGoalState::SUCCEEDED))  
    {  
       usleep(1000*20);  
    }  
   ROS_INFO("机器人到达目标点1");  
   
   ac.sendGoal(goal2_pre);  
  while(!(ac.getState()==actionlib::SimpleClientGoalState::SUCCEEDED))  
    {  
       usleep(1000*20);  
    }  
   ROS_INFO("机器人到达目标点1");  
   ac.sendGoal(goal2);  
  while(!(ac.getState()==actionlib::SimpleClientGoalState::SUCCEEDED))  
    {  
       usleep(1000*20);  
    }  
   ROS_INFO("机器人到达目标点2");  
  
  ac.sendGoal(goal3_pre);  
  while(!(ac.getState()==actionlib::SimpleClientGoalState::SUCCEEDED))  
    {  
       usleep(1000*20);  
    }  
   ROS_INFO("机器人到达目标点1");  
  ac.sendGoal(goal3);  
  while(!(ac.getState()==actionlib::SimpleClientGoalState::SUCCEEDED))  
    {  
       usleep(1000*20);  
    }  
   ROS_INFO("机器人到达目标点3"); 
 
 ac.sendGoal(goal4_pre);  
  while(!(ac.getState()==actionlib::SimpleClientGoalState::SUCCEEDED))  
    {  
       usleep(1000*20);  
    }  
   ROS_INFO("机器人到达目标点1");  
 ac.sendGoal(goal4);  
  while(!(ac.getState()==actionlib::SimpleClientGoalState::SUCCEEDED))  
    {  
       usleep(1000*20);  
    }  
   ROS_INFO("机器人到达目标点4"); 
 
 ac.sendGoal(goal5_pre);  
  while(!(ac.getState()==actionlib::SimpleClientGoalState::SUCCEEDED))  
    {  
       usleep(1000*20);  
    }  
   ROS_INFO("机器人到达目标点1");  
 ac.sendGoal(goal5);  
  while(!(ac.getState()==actionlib::SimpleClientGoalState::SUCCEEDED))  
    {  
       usleep(1000*20);  
    }  
   ROS_INFO("机器人到达目标点5");  
 }  
  return 0;  
}  

