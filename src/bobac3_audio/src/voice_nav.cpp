#include <ros/ros.h>
#include <robot_audio/robot_iat.h>
#include <robot_audio/Collect.h>
#include <robot_audio/robot_tts.h>
#include <actionlib/client/simple_action_client.h>
#include <relative_move/SetRelativeMove.h>
#include <ar_pose/Track.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <dynamic_reconfigure/Reconfigure.h>
#include <iostream>
#include <string>
using namespace std;

struct Point {
    float x;              // x 坐标
    float y;              // y 坐标
    float z;              // 姿态 z
    float w;              // 姿态 w
    string name;          // 地点名字
    string present;       // 介绍语
    bool use_orientation; // 是否使用指定的位姿
    bool use_xy_tolerance; // 是否使用严格的xy_goal_tolerance
};

// Updated m_point array with correct initialization
struct Point m_point[7] = {
    {1.054, 2.090, 1.000, 0.023, "上海", "上海，简称 ‘沪’ 或 ‘申’，是中国直辖市，位于长江入海口，是国际经济、金融、贸易、航运、科技创新中心，有独特海派文化。", false, false}, // 0
    {1.061, 1.119, 0.005, 1.000, "深圳", "深圳，是广东副省级市、经济特区。毗邻香港，经济发达，创新力强，有众多世界500 强企业，是粤港澳大湾区中心城市。", false, false}, // 1
    {2.531, 2.116, 0.999, 0.045, "吉林省", "吉林省，简称 ‘吉’，地处东北中部，与俄、朝接壤。是重要商品粮基地与老工业基地，有长白山等美景，人文风情浓郁。", false, false}, // 2
    {2.510, 1.128, 0.998, 0.069, "广州", "广州，别称羊城、花城，广东省会。历史悠久，美食诱人，经济发达，是充满魅力与活力的国家中心城市和粤港澳大湾区核心。", false, false}, // 3
    {2.521, 0.117, 1.000, 0.000, "北京", "北京，中国首都，千年古都与现代都市交融，尽显独特魅力。这里有宏伟的故宫、绵延的长城等历史古迹，见证着岁月的沧桑变迁。", false, false}, // 4
    {0.026, -0.008, -0.737, 0.676, "原点", "已回家", false, true}, // 5
    {0.552, 2.024, -0.621, 0.784, "充电", "充电成功", true, false} // 6
};

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> AC;

class interaction {
public:
    interaction();
    string voice_collect();
    string voice_dictation(const char* filename);
    string voice_tts_fast(const char* text, float speed);
    void goto_nav(struct Point* point);
    void charge(void);
    void walk(float x, float y);
private:
    ros::NodeHandle n;
    actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> ac;
    ros::ServiceClient collect_client, dictation_client, tts_client, relative_move_client, ar_track_client;

    // Feedback callback for move_base
    void feedbackCb(const move_base_msgs::MoveBaseFeedbackConstPtr& feedback);
};

interaction::interaction() : ac("move_base", true) {
    collect_client = n.serviceClient<robot_audio::Collect>("voice_collect");
    dictation_client = n.serviceClient<robot_audio::robot_iat>("voice_iat");
    tts_client = n.serviceClient<robot_audio::robot_tts>("voice_tts");
    relative_move_client = n.serviceClient<relative_move::SetRelativeMove>("relative_move");
    ar_track_client = n.serviceClient<ar_pose::Track>("track");
}

// Feedback callback implementation
void interaction::feedbackCb(const move_base_msgs::MoveBaseFeedbackConstPtr& feedback) {
    ROS_INFO("Navigation feedback: Current position (x: %.3f, y: %.3f, z: %.3f)",
             feedback->base_position.pose.position.x,
             feedback->base_position.pose.position.y,
             feedback->base_position.pose.position.z);
}

string interaction::voice_collect() {
    ros::service::waitForService("voice_collect", ros::Duration(5.0));
    robot_audio::Collect srv;
    srv.request.collect_flag = 1;
    if (collect_client.call(srv)) {
        return srv.response.voice_filename;
    }
    return "";
}

string interaction::voice_dictation(const char* filename) {
    ros::service::waitForService("voice_iat", ros::Duration(5.0));
    robot_audio::robot_iat srv;
    srv.request.audiopath = filename;
    if (dictation_client.call(srv)) {
        return srv.response.text;
    }
    return "";
}

string interaction::voice_tts_fast(const char* text, float speed) {
    ros::service::waitForService("voice_tts", ros::Duration(5.0));
    robot_audio::robot_tts srv;
    srv.request.text = text;
    if (tts_client.call(srv)) {
        string cmd = "play " + srv.response.audiopath + " speed " + to_string(speed);
        system(cmd.c_str());
        sleep(1);
        return srv.response.audiopath;
    }
    return "";
}

void interaction::goto_nav(struct Point* point) {
    ROS_INFO("等待 action 服务器启动 for %s", point->name.c_str());
    for (int i = 0; i < 3; ++i) {
        if (ac.waitForServer(ros::Duration(10.0))) {
            ROS_INFO("Action 服务器已启动 for %s", point->name.c_str());
            break;
        }
        if (i == 2) {
            ROS_ERROR("Action 服务器未启动 for %s", point->name.c_str());
            return;
        }
    }

    ROS_INFO("发送目标到 %s (use_orientation: %d, use_xy_tolerance: %d)",
             point->name.c_str(), point->use_orientation, point->use_xy_tolerance);

    // Configure dynamic reconfigure for yaw_goal_tolerance and xy_goal_tolerance
    dynamic_reconfigure::Reconfigure srv;
    dynamic_reconfigure::DoubleParameter yaw_param, xy_param;

    // Set yaw_goal_tolerance
    yaw_param.name = "yaw_goal_tolerance";
    yaw_param.value = point->use_orientation ? 0.06 : 6.28;
    srv.request.config.doubles.push_back(yaw_param);

    // Set xy_goal_tolerance
    xy_param.name = "xy_goal_tolerance";
    xy_param.value = point->use_xy_tolerance ? 0.02 : 0.03;
    srv.request.config.doubles.push_back(xy_param);

    ros::ServiceClient reconfig_client = n.serviceClient<dynamic_reconfigure::Reconfigure>(
        "/move_base_node/DWAPlannerROS/set_parameters");
    if (ros::service::waitForService("/move_base_node/DWAPlannerROS/set_parameters", ros::Duration(5.0))
        && reconfig_client.call(srv)) {
        ROS_INFO("已设置 yaw_goal_tolerance 为 %f, xy_goal_tolerance 为 %f for %s",
                 yaw_param.value, xy_param.value, point->name.c_str());
    } else {
        ROS_ERROR("Failed to set dynamic parameters for %s", point->name.c_str());
    }

    move_base_msgs::MoveBaseGoal goal;
    goal.target_pose.header.frame_id = "map";
    goal.target_pose.header.stamp = ros::Time::now();
    goal.target_pose.pose.position.x = point->x;
    goal.target_pose.pose.position.y = point->y;
    if (point->use_orientation) {
        goal.target_pose.pose.orientation.x = 0.0;
        goal.target_pose.pose.orientation.y = 0.0;
        goal.target_pose.pose.orientation.z = point->z;
        goal.target_pose.pose.orientation.w = point->w;
        ROS_INFO("使用指定朝向: z=%f, w=%f", point->z, point->w);
    } else {
        goal.target_pose.pose.orientation.x = 0.0;
        goal.target_pose.pose.orientation.y = 0.0;
        goal.target_pose.pose.orientation.z = 0.0;
        goal.target_pose.pose.orientation.w = 1.0;
        ROS_INFO("使用默认朝向: x=0, y=0, z=0, w=1");
    }

    // Send goal with feedback callback
    ac.sendGoal(goal, actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction>::SimpleDoneCallback(),
                actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction>::SimpleActiveCallback(),
                boost::bind(&interaction::feedbackCb, this, _1));

    if (ac.waitForResult(ros::Duration(60.0))) {
        if (ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED) {
            ROS_INFO("导航目标成功 for %s!", point->name.c_str());
        } else {
            ROS_WARN("导航目标未成功 for %s, state: %s", point->name.c_str(),
                     ac.getState().toString().c_str());
        }
    } else {
        ROS_WARN("导航目标超时 for %s", point->name.c_str());
    }
    ac.cancelGoal();
}

void interaction::charge(void) {
    ros::service::waitForService("relative_move", ros::Duration(5.0));
    ros::service::waitForService("track", ros::Duration(5.0));
    relative_move::SetRelativeMove RelativeMove_data;
    ar_pose::Track Track_data;
    Track_data.request.ar_id = 0;
    Track_data.request.goal_dist = 0.3;
    if (ar_track_client.call(Track_data)) {
        RelativeMove_data.request.goal.x = -0.1;
        RelativeMove_data.request.global_frame = "odom";
        relative_move_client.call(RelativeMove_data);
    }
}

void interaction::walk(float x, float y) {
    ros::service::waitForService("relative_move", ros::Duration(5.0));
    relative_move::SetRelativeMove RelativeMove_data;
    RelativeMove_data.request.goal.x = y;
    RelativeMove_data.request.goal.y = x;
    RelativeMove_data.request.global_frame = "odom";
    relative_move_client.call(RelativeMove_data);
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "interaction");
    int flag = 1;
    interaction audio;
    string dir, text, path;
    while (ros::ok()) {
        dir = audio.voice_collect();
        if (dir.empty()) {
            continue;
        }
        text = audio.voice_dictation(dir.c_str());
        if (text.empty()) {
            continue;
        }
        if (text.find("元宝") != string::npos) {
            audio.voice_tts_fast("哎什么事", 1.0);
            flag = 1;
        }

        if (flag) {
            if (text.find("参观") != string::npos) {
                audio.voice_tts_fast("好的", 1.0);
                for (int i = 0; i < 5; i++) {
                    audio.goto_nav(&m_point[i]);
                    audio.voice_tts_fast(m_point[i].present.c_str(), 1.5);
                }
                audio.goto_nav(&m_point[5]);
            }
            else if (text.find("到") != string::npos) {
                audio.voice_tts_fast(("好的这就带您去" + m_point[0].name + "馆").c_str(), 1.5);
                audio.goto_nav(&m_point[0]);
                audio.voice_tts_fast(m_point[0].present.c_str(), 1.5);
                audio.goto_nav(&m_point[6]);
                audio.charge();
                audio.voice_tts_fast(m_point[6].present.c_str(), 1.5);
                sleep(2);
                audio.goto_nav(&m_point[5]);
            }
        }
        ros::spinOnce();
    }
    return 0;
}
