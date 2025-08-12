/*
 * @Author: Zhaoq 1327153842@qq.com
 * @Date: 2022-08-02 13:29:22
 * @LastEditors: Zhaoq 1327153842@qq.com
 * @LastEditTime: 2023-02-02 14:20:44
 * @Gitee: https://gitee.com/REINOVO
 * @Description: 手柄速度控制节点
 */
#include<robot_joy/robot_joy.h>

using namespace std;



TeleopJoy::TeleopJoy():n("~"),joy_wakeup_flag_(false), joy_zero_flag_(false)
{

    n.param<int>("axis_linear_x",i_velLinear_x,1);//x方向控制键（前进后退）axis
    n.param<int>("axis_linear_y",i_velLinear_y,0);//y方向控制键（左移右移）axis
    n.param<int>("axis_angular",i_velAngular,3);//yaw角控制键（左转右转）axis

    n.param<int>("axis_accelerator",i_accelerator,5);//加速键 axis
    n.param<int>("axis_deceleration",i_deceleration,2);//减速键 axis

    n.param<int>("button_max_linear_increase",i_maxLinearVelIncrease,0);//改变最大线速度
    n.param<int>("button_max_angular_increase",i_maxAngularVelIncrease,2);//增加最大角速度
    n.param<int>("button_max_linear_reduce",i_maxLinearVelReduce,1);//减少最大线速度
    n.param<int>("button_max_angular_reduce",i_maxAngularVelReduce,3);//减少最小角速度

    

    n.param<double>("linear_vel_max", f_velLinearMax, 0.8);//最大线速度可增加到的最大值（无论如何加速也会限制在该速度下）
    n.param<double>("angular_vel_max", f_velAngularMax, 3);//最大角速度可增加到的最大值（无论如何加速也会限制在该速度下）
    n.param<double>("linear_vel", f_velLinear, 0.3);//初始最大线速度
    n.param<double>("angular_vel", f_velAngular, 0.6);//初始最大角速度
    ros::SubscriberStatusCallback pub_marker_cb = std::bind( [&]{
        if (pub.getNumSubscribers()>0)
        {
            flag_publish_maker_ = true;
            ROS_INFO_STREAM("Starting publish vel.");
        }
        else 
        {
            flag_publish_maker_ = false;
            ROS_INFO_STREAM("Stopping publish vel.");
        }
    });
    pub = nh.advertise<geometry_msgs::Twist>("cmd_vel",1, pub_marker_cb, pub_marker_cb);
    sub = nh.subscribe<sensor_msgs::Joy>("joy", 1, &TeleopJoy::callBack, this);
}

void TeleopJoy::callBack(const sensor_msgs::Joy::ConstPtr& joy)
{
    last_time_ = ros::Time::now();
    joy_zero_flag_ = false;
    if(joy_wakeup_flag_){
        if(!(joy->axes[0]||joy->axes[1]||joy->axes[3])){
            joy_zero_flag_ = true;
        }
        if(flag_publish_maker_){
            //slow RT:axis[5]; faster LT axis[2]
            //add linear B; add angular Y
            //reduce  linear A; add angular X
            float gain=1.0;
            if(joy->axes[5] == -1){//RT加速
                gain = 1.5;
                ROS_INFO("accelerate....");
            }else if(joy->axes[2] == -1){//LT减速
                gain = 0.6;
                ROS_INFO("slow dwon....");
            }
            if(joy->buttons[0] == 1){//A减小最大线速度
                f_velLinear -= 0.15;
                if(f_velLinear > 0)
                    ROS_INFO("linear velocity reduce to %lf", f_velLinear);
                else{
                    f_velLinear = 0.1;
                    ROS_INFO("The minimum linear speed limit has been reached");
                }
            }
            if(joy->buttons[1] == 1){//B增大最大线速度
                f_velLinear += 0.15;
                if(f_velLinear<=f_velLinearMax)
                    ROS_INFO("linear velocity add to %lf", f_velLinear);
                else{
                    f_velLinear = f_velLinearMax;
                    ROS_INFO("The maximum linear speed limit has been reached");
                }
            }
            if(joy->buttons[2] == 1){//X减小最大角速度
                f_velAngular -=0.3;
                if(f_velAngular > 0)
                    ROS_INFO("angluar velocity reduce to %lf", f_velAngular);
                else{
                    f_velAngular = 0.3;
                    ROS_INFO("The minimum angular speed limit has been reached");
                }
                
            }else if(joy->buttons[3] == 1){//Y增加最大角速度
                f_velAngular +=0.3;
                if(f_velAngular<=f_velAngularMax)
                    ROS_INFO("angluar velocity add to %lf", f_velAngular);
                else{
                    f_velAngular = f_velAngularMax;
                    ROS_INFO("The maximum angular speed limit has been reached");
                }
            }
            vel.angular.z = joy->axes[i_velAngular]*f_velAngular*gain;
            vel.linear.x = joy->axes[i_velLinear_x]*f_velLinear*gain;
            vel.linear.y = joy->axes[i_velLinear_y]*f_velLinear*gain;
            if(vel.linear.x>(f_velLinearMax*gain)) vel.linear.x = f_velLinearMax*gain;
            if(vel.linear.y>(f_velLinearMax*gain)) vel.linear.y = f_velLinearMax*gain;
            if(vel.angular.z>(f_velAngularMax*gain)) vel.angular.z = f_velAngularMax*gain;
        }
        
    }
    if(joy->buttons[9]&&joy->buttons[10]){
        joy_wakeup_flag_ = !joy_wakeup_flag_;
        if(joy_wakeup_flag_) ROS_WARN("joy vel controller wakeup");
        else ROS_WARN("joy vel controller sleep");
    }
}

