#include "ros/ros.h"
#include "robot_audio/Control.h"
#include "robot_audio/robot_tts.h"
#include <unistd.h>
#include <bobac3_msgs/SetRelativeMove.h>

class Control{
public:
    Control();
    ~Control();
private:
	ros::NodeHandle nh;
	ros::ServiceServer control_server;
	bool control_cb(robot_audio::Control::Request &req,robot_audio::Control::Response &res);
	ros::ServiceClient move_client;
	bobac3_msgs::SetRelativeMove move_srv;
	robot_audio::robot_tts tts_srv;
	ros::ServiceClient tts_client;
	ros::ServiceClient neck_client;
};
