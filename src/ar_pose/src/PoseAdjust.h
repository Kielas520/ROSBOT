#ifndef REI_AR_POSE_H__
#define REI_AR_POSE_H__
#include <ar_pose/Track.h>
#include <ar_track_alvar_msgs/AlvarMarkers.h>
#include <geometry_msgs/Pose2D.h>
#include <geometry_msgs/Twist.h>
// #include <pid_lib/pid.h>
#include <relative_move/SetRelativeMove.h>
#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include <tf2/LinearMath/Transform.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <tf2_ros/transform_listener.h>

#include <memory>
#include <mutex>
#include <thread>
namespace rei_ar_pose {
class ArPoseAdjust {
 public:
  ArPoseAdjust();
  ~ArPoseAdjust();
  int8_t Init(ros::NodeHandle& nh, bool getMarkerFromTopic, double targetRoll, double targetPitch, double targetYaw);
  geometry_msgs::Twist GetTargetAheadPose(
      geometry_msgs::Transform &inTransform);
  geometry_msgs::Transform GetTfPose() {
    std::unique_lock<std::mutex> lock(tfPoseMutex_);
    return markerPose_;
  }
  int8_t RelativeMove(double x, double y, double theta);
  // void SetXPid(int p, int i, int d);
  // void SetYPid(int p, int i, int d);
  // void SetThetaPid(int p, int i, int d);

 private:
  bool TrackCb(ar_pose::Track::Request &req, ar_pose::Track::Response &res);
  void ListenTf(std::string frameId, std::string childFrameId);
  void SetFinishedFlag(bool state) {
    std::unique_lock<std::mutex> lock(flagMutex_);
    trackFinished_ = state;
  }
  bool GetFinishedFlag() {
    std::unique_lock<std::mutex> lock(flagMutex_);
    return trackFinished_;
  }
  bool GetTargetFlag() {
    std::unique_lock<std::mutex> lock(flagMutex_);
    return getTargetFlag_;
  }
  void SetTfPose(const geometry_msgs::Transform &pose) {
    std::unique_lock<std::mutex> lock(tfPoseMutex_);
    markerPose_ = pose;
  }
  int8_t FindTarget();
  int8_t GetMarkerPoseFromTopic();
  int8_t GetMarkerPoseFromTf(std::string frameId, std::string childFrameId);
  int8_t GetMarkerPose();
  bool GetStartFlag() {
    std::unique_lock<std::mutex> lock(flagMutex_);
    return startFlag_;
  }
  void SetStartFlag(bool state) {
    std::unique_lock<std::mutex> lock(flagMutex_);
    startFlag_ = state;
  }

 private:
  ros::NodeHandle nh_;
  geometry_msgs::Transform markerPose_;
  bool trackFinished_;
  bool getTargetFlag_;
  std::mutex tfPoseMutex_;
  std::mutex flagMutex_;
  std::thread listenTfThread_;
  // std::shared_ptr<rei_tools::ReiPID> xPid_;
  // std::shared_ptr<rei_tools::ReiPID> yPid_;
  // std::shared_ptr<rei_tools::ReiPID> thetaPid_;
  std::shared_ptr<tf2_ros::TransformListener> tfListener_;
  std::unique_ptr<tf2_ros::Buffer> tfBuffer_;
  double expectXErr_, expectYErr_, expectThetaErr_;
  // ros::Publisher velPub_, xErrPub_, yErrPub_, thetaErrPub_;
  ros::ServiceServer trackServer_;
  ros::ServiceClient relativeMoveClient_;
  geometry_msgs::Twist stopCmd_;
  ros::Subscriber markerSub_;
  bool startFlag_;
  int targetId_;
  bool getMarkerFromTopic_;
  double roll_, pitch_, yaw_;
};
}  // namespace rei_ar_pose

#endif