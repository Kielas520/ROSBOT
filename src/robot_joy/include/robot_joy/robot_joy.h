#include<ros/ros.h>
#include<geometry_msgs/Twist.h>
#include<sensor_msgs/Joy.h>
#include<iostream>

class TeleopJoy
{
public:
    
    static TeleopJoy& getInstance(){
        static TeleopJoy instance;
        return instance;
    }
    void run(){
        ros::Rate loop(10);
        while(ros::ok()){
            ros::spinOnce();
            if(joy_wakeup_flag_){
                if(flag_publish_maker_) pub.publish(vel);
                if(joy_zero_flag_){
                    if((ros::Time::now().toSec() - last_time_.toSec())>30){
                        joy_wakeup_flag_ = false;
                        joy_zero_flag_ = false;
                        ROS_WARN("joy vel controller has sleeped");
                    }
                }
                
            }
            loop.sleep();
        }
    }
private:
    void callBack(const sensor_msgs::Joy::ConstPtr& joy);
    ros::NodeHandle n;
    ros::NodeHandle nh;
    ros::Subscriber sub;
    ros::Publisher pub;
    geometry_msgs::Twist vel;
    int i_velLinear_x, i_velLinear_y, i_velAngular; //axes number
    int i_accelerator, i_deceleration;
    int i_maxLinearVelIncrease, i_maxAngularVelIncrease, i_maxLinearVelReduce, i_maxAngularVelReduce;
    double f_velLinearMax, f_velAngularMax, f_velLinear, f_velAngular;
    bool flag_publish_maker_;
    bool joy_wakeup_flag_, joy_zero_flag_;

    ros::Time last_time_, now_time_;

    TeleopJoy();
    ~TeleopJoy(){
        geometry_msgs::Twist stop;
        pub.publish(stop);
    }
    TeleopJoy(const TeleopJoy& other) = delete;
    TeleopJoy& operator=(const TeleopJoy& other) = delete;
    
};