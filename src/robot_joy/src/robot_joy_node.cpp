#include <robot_joy/robot_joy.h>
int main(int argc, char** argv)
{
    ros::init(argc, argv, "robot_joy");
    TeleopJoy& teleop_rei = TeleopJoy::getInstance();
    teleop_rei.run();
    return 0;
}