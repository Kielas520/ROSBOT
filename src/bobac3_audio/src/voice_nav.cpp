#include <ros/ros.h>
#include <robot_audio/robot_iat.h>
#include <robot_audio/Collect.h>
#include <robot_audio/robot_tts.h>
#include <actionlib/client/simple_action_client.h>
#include <relative_move/SetRelativeMove.h>
#include <ar_pose/Track.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <dynamic_reconfigure/Reconfigure.h>
#include <face_rec/recognition_results.h>
#include <flame_detector/DetectFlame.h>
#include <iostream>
#include <string>
#include <vector>
// #include <ros/package.h> // 移除此头文件，因为不再使用 ros::package
using namespace std;

// 结构体和类定义保持不变
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

struct Speak {
    string text;
};

struct Commander {
    string name;
};

struct Point m_point[7] = {
    {2.531, 2.116, 0.0, 1.045, "吉林", "吉林省，简称 ‘吉’，地处东北中部，与俄、朝接壤。是重要商品粮基地与老工业基地，有长白山等美景，人文风情浓郁。", true, false}, // 0
    {2.510, 1.128, 0.0, 1.069, "广州", "广州，别称羊城、花城，广东省会。历史悠久，美食诱人，经济发达，是充满魅力与活力的国家中心城市和粤港澳大湾区核心。", true, false}, // 1
    {2.521, 0.117, 0.000, 1.000, "北京", "北京，中国首都，千年古都与现代都市交融，尽显独特魅力。这里有宏伟的故宫、绵延的长城等历史古迹，见证着岁月的沧桑变迁。", true, false}, // 2
    {1.061, 1.119, 0.005, 1.000, "深圳", "深圳，是广东副省级市、经济特区。毗邻香港，经济发达，创新力强，有众多世界500 强企业，是粤港澳大湾区中心城市。", true, false}, // 3
    {1.054, 2.090, 0.000, 1.023, "上海", "上海，简称 ‘沪’ 或 ‘申’，是中国直辖市，位于长江入海口，是国际经济、金融、贸易、航运、科技创新中心，有独特海派文化。", true, false}, // 4
    {0.026, -0.008, -0.737, 0.676, "原点", "已回家", false, true}, // 5
    {0.452, 1.764, -0.635, 0.772, "充电", "充电成功", true, false} // 6
};

struct Speak speak[8] = {
    {"未放置灭火器。"},
    {"发现火源。"},
    {"这里就是"},
    {"啦，我要继续回去工作啦！"},
    {"你好，欢迎您的到来！有什么需要帮助的吗？"},
    {"好的，请跟我来。"},
    {"你好，管理员"},
    {"好的，进入巡检模式。"}
};

struct Commander commander[1] {
    {"周晓铭"}
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
    bool face_rec(int mode, int& face_num, std::vector<std::string>& face_names);
    bool flame_detect(float duration, bool& flame, bool& extinguisher);
    void play(); // Added play function declaration

private:
    ros::NodeHandle n;
    actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> ac;
    ros::ServiceClient collect_client, dictation_client, tts_client, relative_move_client, ar_track_client;
    ros::ServiceClient face_rec_client;
    ros::ServiceClient flame_detect_client;

    void feedbackCb(const move_base_msgs::MoveBaseFeedbackConstPtr& feedback);
};

interaction::interaction() : ac("move_base", true) {
    collect_client = n.serviceClient<robot_audio::Collect>("voice_collect");
    dictation_client = n.serviceClient<robot_audio::robot_iat>("voice_iat");
    tts_client = n.serviceClient<robot_audio::robot_tts>("voice_tts");
    relative_move_client = n.serviceClient<relative_move::SetRelativeMove>("relative_move");
    ar_track_client = n.serviceClient<ar_pose::Track>("track");
    face_rec_client = n.serviceClient<face_rec::recognition_results>("face_recognition_results");
    flame_detect_client = n.serviceClient<flame_detector::DetectFlame>("/detect_flame");
}

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

void interaction::play() {
    string package_path = "/home/reicom2025/ros_workspace/src/bobac3_audio";
    string audio_path = package_path + "/audio/alarm.mp3";
    string cmd = "play " + audio_path;
    ROS_INFO("Playing alarm audio: %s", audio_path.c_str());
    int result = system(cmd.c_str());
    if (result != 0) {
        ROS_ERROR("Failed to play audio, system command returned: %d", result);
    } else {
        ROS_INFO("Audio played successfully");
    }
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

    dynamic_reconfigure::Reconfigure srv;
    dynamic_reconfigure::DoubleParameter yaw_param, xy_param;
    yaw_param.name = "yaw_goal_tolerance";
    yaw_param.value = point->use_orientation ? 0.06 : 6.28;
    srv.request.config.doubles.push_back(yaw_param);
    xy_param.name = "xy_goal_tolerance";
    xy_param.value = point->use_xy_tolerance ? 0.02 : 0.05;
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

    ac.sendGoal(goal,
                actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction>::SimpleDoneCallback(),
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

bool interaction::face_rec(int mode, int& face_num, std::vector<std::string>& face_names) {
    if (!ros::service::waitForService("face_recognition_results", ros::Duration(5.0))) {
        ROS_ERROR("Face recognition service not available after waiting");
        return false;
    }
    face_rec::recognition_results srv;
    srv.request.mode = mode;
    if (!face_rec_client.call(srv)) {
        ROS_ERROR("Failed to call face recognition service");
        return false;
    }
    if (!srv.response.success) {
        ROS_WARN("Face recognition service call was not successful");
        return false;
    }
    face_num = srv.response.result.num;
    face_names.clear();
    for (int i = 0; i < face_num; ++i) {
        face_names.push_back(srv.response.result.face_data[i].name);
    }
    ROS_INFO("Detected %d faces", face_num);
    return true;
}

bool interaction::flame_detect(float duration, bool& flame, bool& extinguisher) {
    if (!ros::service::waitForService("/detect_flame", ros::Duration(5.0))) {
        ROS_ERROR("火焰检测服务 /detect_flame 未启动");
        return false;
    }

    flame_detector::DetectFlame srv;
    if (flame_detect_client.call(srv)) {
        flame = srv.response.is_flame_detected;
        extinguisher = srv.response.is_extinguisher_detected;
        ROS_INFO("火焰检测完成: 火焰=%s, 灭火器=%s",
                 flame ? "是" : "否",
                 extinguisher ? "是" : "否");
        return true;
    } else {
        ROS_ERROR("调用火焰检测服务失败");
        return false;
    }
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "interaction");
    interaction audio;
    string dir, text;
    int face_num;
    std::vector<std::string> face_names;
    bool is_awake = false;
    ros::Time last_face_time;
    while (ros::ok()) {
        if (!is_awake) {
            if (audio.face_rec(1, face_num, face_names)) {
                if (face_num > 0) {
                    bool is_admin = false;
                    for (const auto& name : face_names) {
                        if (name == commander[0].name) {
                            is_admin = true;
                            break;
                        }
                    }
                    if (is_admin) {
                        audio.voice_tts_fast((speak[6].text + commander[0].name).c_str(), 1);
                    } else {
                        audio.voice_tts_fast(speak[4].text.c_str(), 1);
                    }
                    is_awake = true;
                    last_face_time = ros::Time::now();
                    ROS_INFO("Robot awakened, detected %d faces, admin: %s", face_num, is_admin ? "yes" : "no");
                } else {
                    ROS_INFO("未检测到人脸");
                }
            }
            ros::spinOnce();
            continue;
        }
        
        // if ((ros::Time::now() - last_face_time).toSec() >= 3.0) {
        //     if (audio.face_rec(1, face_num, face_names)) {
        //         ROS_INFO("3秒后人脸检测，检测到 %d 个人脸，名称如下：", face_num);
        //         for (const auto& name : face_names) {
        //             ROS_INFO("人脸名称: %s", name.c_str());
        //         }

        //         if (face_num == 0) {
        //             is_awake = false;
        //             ROS_INFO("No faces detected after 3 seconds, returning to face detection mode");
        //         } else {
        //             last_face_time = ros::Time::now();
        //         }
        //     } else {
        //         ROS_ERROR("人脸检测服务调用失败");
        //     }
        // }
        if (is_awake){
            dir = audio.voice_collect();
            text = audio.voice_dictation(dir.c_str());
            if (text.empty()) {
                ros::spinOnce();
                is_awake = false;
                continue;
            }

            if (text.find("到") != string::npos) {
                bool matched = false;
                for (int i = 0; i < 5; i++) {
                    if (text.find(m_point[i].name) != string::npos) {
                        matched = true;
                        audio.voice_tts_fast(("好的这就带您去" + m_point[i].name + "馆").c_str(), 1);
                        audio.goto_nav(&m_point[i]);
                        audio.voice_tts_fast(m_point[i].present.c_str(), 1);
                        audio.voice_tts_fast(("这里就是" + m_point[i].name + "馆" + speak[3].text).c_str(), 1);
                        audio.goto_nav(&m_point[5]);
                        is_awake = false;
                        ROS_INFO("Task completed for %s, returning to face detection mode", m_point[i].name.c_str());
                        break;
                    }
                }
                // if (!matched) {
                //     audio.voice_tts_fast("抱歉，未识别到有效地点，请再说一遍", 1);
                // }
            }
            else if (text.find("巡检") != string::npos) {
                audio.voice_tts_fast(speak[7].text.c_str(), 1);
                ROS_INFO("进入巡检模式");

                for (int i = 0; i < 5; i++) {
                    audio.goto_nav(&m_point[i]);
                    ROS_INFO("到达巡检点: %s", m_point[i].name.c_str());

                    bool flame = false, extinguisher = false;
                    if (audio.flame_detect(2.0, flame, extinguisher)) {
                        if (flame) {
                            audio.play();
                            audio.voice_tts_fast((m_point[i].name + "馆" + speak[1].text).c_str(), 1);
                        }
                        if (!extinguisher) {
                            audio.play();
                            audio.voice_tts_fast((m_point[i].name + "馆" + speak[0].text).c_str(), 1);
                        }
                    } else {
                        ROS_ERROR("火焰检测失败 at %s", m_point[i].name.c_str());
                    }
                }

                audio.goto_nav(&m_point[6]);
                ROS_INFO("到达充电点");
                audio.charge();
                audio.voice_tts_fast(m_point[6].present.c_str(), 1);

                ros::Duration(2.0).sleep();

                audio.goto_nav(&m_point[5]);
                ROS_INFO("返回原点，巡检任务完成");

                is_awake = false;
            }
        }
        ros::spinOnce();
    }
    return 0;
}