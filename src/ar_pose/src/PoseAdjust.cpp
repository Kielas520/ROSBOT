#include "PoseAdjust.h"

namespace rei_ar_pose {
ArPoseAdjust::ArPoseAdjust()
    : getTargetFlag_(false),
      trackFinished_(false),
      startFlag_(false),
      targetId_(-1),
      getMarkerFromTopic_(true),
      roll_(0.0),
      pitch_(0.0),
      yaw_(0.0) {}
ArPoseAdjust::~ArPoseAdjust() {
  // SetFinishedFlag(true);
  // if (listenTfThread_.joinable()) listenTfThread_.join();
}
int8_t ArPoseAdjust::Init(ros::NodeHandle& nh, bool getMarkerFromTopic, double targetRoll, double targetPitch, double targetYaw) {
  nh_ = nh;
  getMarkerFromTopic_ = getMarkerFromTopic;
  trackServer_ = nh_.advertiseService("track", &ArPoseAdjust::TrackCb, this);
  relativeMoveClient_ =
      nh_.serviceClient<relative_move::SetRelativeMove>("relative_move");
  tfBuffer_ = std::make_unique<tf2_ros::Buffer>();
  tfListener_ = std::make_shared<tf2_ros::TransformListener>(*tfBuffer_);
  expectXErr_ = 0.005;
  expectYErr_ = 0.005;
  expectThetaErr_ = 0.01;
  roll_ = targetRoll;
  pitch_ = targetPitch;
  yaw_ = targetYaw;
  return 0;
}
// void ArPoseAdjust::SetXPid(int p, int i, int d) {
//   xPid_->setP(p);
//   xPid_->setI(i);
//   xPid_->setD(d);
// }
// void ArPoseAdjust::SetYPid(int p, int i, int d) {
//   yPid_->setP(p);
//   yPid_->setI(i);
//   yPid_->setD(d);
// }
// void ArPoseAdjust::SetThetaPid(int p, int i, int d) {
//   thetaPid_->setP(p);
//   thetaPid_->setI(i);
//   thetaPid_->setD(d);
// }
int8_t ArPoseAdjust::GetMarkerPoseFromTopic() {
  ar_track_alvar_msgs::AlvarMarkers::ConstPtr markersPtr =
      ros::topic::waitForMessage<ar_track_alvar_msgs::AlvarMarkers>(
          "bottom_camera/ar_pose_marker", ros::Duration(1.0));
  if (markersPtr != NULL) {
    int idx = 0;
    for (auto marker : markersPtr->markers) {
      if (marker.id == targetId_) {
        geometry_msgs::Transform pose;
        pose.translation.x = marker.pose.pose.position.x;
        pose.translation.y = marker.pose.pose.position.y;
        pose.translation.z = marker.pose.pose.position.z;
        pose.rotation = marker.pose.pose.orientation;
        SetTfPose(pose);
        if (!GetTargetFlag()) {
          std::unique_lock<std::mutex> lock(flagMutex_);
          getTargetFlag_ = true;
        }
        break;
      }
      idx++;
    }
    if (idx == markersPtr->markers.size()) {
      std::unique_lock<std::mutex> lock(flagMutex_);
      getTargetFlag_ = false;
      return -1;
    }
    return 0;
  }
  return -1;
}

int8_t ArPoseAdjust::GetMarkerPoseFromTf(std::string frameId,
                                         std::string childFrameId) {
  geometry_msgs::TransformStamped transform;
  try {
    transform = tfBuffer_->lookupTransform(frameId, childFrameId, ros::Time(0),
                                           ros::Duration(1.0));
    if (!GetTargetFlag()) {
      std::unique_lock<std::mutex> lock(flagMutex_);
      getTargetFlag_ = true;
    }
    SetTfPose(transform.transform);

  } catch (tf2::TransformException& ex) {
    ROS_WARN("%s", ex.what());
    {
      std::unique_lock<std::mutex> lock(flagMutex_);
      getTargetFlag_ = false;
    }
    return -1;
  }
  return 0;
}
int8_t ArPoseAdjust::GetMarkerPose() {
  if (getMarkerFromTopic_)
    return GetMarkerPoseFromTopic();
  else {
    std::string childFrameId = "ar_marker_" + std::to_string(targetId_);
    return GetMarkerPoseFromTf("base_link", childFrameId);
  }
}
void ArPoseAdjust::ListenTf(std::string frameId, std::string childFrameId) {
  geometry_msgs::TransformStamped transform;
  std::string errMsg;
  if (!tfBuffer_->canTransform(frameId, childFrameId, ros::Time(0),
                               ros::Duration(2.0), &errMsg)) {
    ROS_ERROR("Unable to get pose from TF: %s", errMsg.c_str());
    return;
  }
  {
    std::unique_lock<std::mutex> lock(flagMutex_);
    getTargetFlag_ = true;
  }
  ros::Rate rate(10.0);
  while (nh_.ok() && (!GetFinishedFlag())) {
    try {
      transform =
          tfBuffer_->lookupTransform(frameId, childFrameId, ros::Time(0));
      SetTfPose(transform.transform);

    } catch (tf2::TransformException& ex) {
      ROS_WARN("%s", ex.what());
      ros::Duration(0.1).sleep();
      {
        std::unique_lock<std::mutex> lock(flagMutex_);
        getTargetFlag_ = false;
      }
      continue;
    }
    rate.sleep();
  }
}
int8_t ArPoseAdjust::RelativeMove(double x, double y, double theta) {
  relative_move::SetRelativeMove cmd;
  cmd.request.global_frame = "odom";
  cmd.request.goal.x = x;
  cmd.request.goal.y = y;
  cmd.request.goal.theta = theta;
  relativeMoveClient_.call(cmd);
  if (!cmd.response.success) {
    ROS_ERROR("RelativeMove error");
    return -1;
  }

  return 0;
}
int8_t ArPoseAdjust::FindTarget(){
  if (RelativeMove(0, 0, 0.25) < 0) {
    ROS_ERROR("RelativeMove error");
    return -2;
  }
  sleep(1);
  if (GetMarkerPose() == 0) {
    ROS_DEBUG("Find");
    return 0;
  }
  if (RelativeMove(0, 0, -0.5) < 0) {
    ROS_ERROR("RelativeMove error");
    return -2;
  }
  sleep(1);
  if (GetMarkerPose() == 0) {
    ROS_DEBUG("Find");
    return 0;
  }
  return -1;
}
// int8_t ArPoseAdjust::FindTarget(std::string frameId, std::string childFrameId) {
//   if (tfBuffer_->canTransform(frameId, childFrameId, ros::Time(0),
//                               ros::Duration(2.0))) {
//     ROS_DEBUG("Find");
//     return 0;
//   }
//   if (RelativeMove(0, 0, 0.35) < 0) {
//     ROS_ERROR("RelativeMove error");
//     return -2;
//   }
//   if (tfBuffer_->canTransform(frameId, childFrameId, ros::Time(0),
//                               ros::Duration(2.0))) {
//     ROS_DEBUG("Find");
//     return 0;
//   }
//   if (RelativeMove(0, 0, -0.7) < 0) {
//     ROS_ERROR("RelativeMove error");
//     return -2;
//   }
//   if (tfBuffer_->canTransform(frameId, childFrameId, ros::Time(0),
//                               ros::Duration(2.0))) {
//     ROS_DEBUG("Find");
//     return 0;
//   }
//   return -1;
// }
geometry_msgs::Twist ArPoseAdjust::GetTargetAheadPose(
    geometry_msgs::Transform& inTransform) {
  geometry_msgs::Transform baseToTargte = GetTfPose();
  tf2::Transform baseToTargteTrans, targetToAheadTrans, baseToAheadTrans;
  tf2::fromMsg(baseToTargte, baseToTargteTrans);
  tf2::fromMsg(inTransform, targetToAheadTrans);
  baseToAheadTrans = baseToTargteTrans * targetToAheadTrans;
  geometry_msgs::Twist outPose;
  outPose.linear.x = baseToAheadTrans.getOrigin().x();
  outPose.linear.y = baseToAheadTrans.getOrigin().y();

  tf2::Matrix3x3 mat(baseToAheadTrans.getRotation());
  double roll, pitch;
  mat.getRPY(roll, pitch, outPose.angular.z);
  ROS_INFO("OutPose: %lf, %lf,, %lf, %lf, %lf, %lf, %lf",
           baseToAheadTrans.getOrigin().x(), baseToAheadTrans.getOrigin().y(),
           baseToAheadTrans.getOrigin().z(), baseToAheadTrans.getRotation().x(),
           baseToAheadTrans.getRotation().y(),
           baseToAheadTrans.getRotation().z(),
           baseToAheadTrans.getRotation().w());
  return outPose;
}
bool ArPoseAdjust::TrackCb(ar_pose::Track::Request& req,
                           ar_pose::Track::Response& res) {
  geometry_msgs::Transform targetTrans;
  targetTrans.translation.z = req.goal_dist;
  // if (listenTfThread_.joinable()) {
  //   res.message = "last move task still run";
  //   return false;
  // }
  trackFinished_ = false;
  getTargetFlag_ = false;
  targetId_ = req.ar_id;
  ros::Rate loop(2);
  int step = 1;
  geometry_msgs::Twist targetPose;
  // std::string childFrameId = "ar_marker_" + std::to_string(req.ar_id);
  // if (FindTarget("base_link", childFrameId) < 0) return true;
  // SetStartFlag(true);
  // listenTfThread_ =
  //     std::thread(&ArPoseAdjust::ListenTf, this, "base_link", childFrameId);
  // double lastTime = ros::Time::now().toSec();
  // while (ros::ok() && (!GetTargetFlag())) {
  //   if ((ros::Time::now().toSec() - lastTime) > 2) return true;
  //   loop.sleep();
  // }
  
  // geometry_msgs::Twist velCmd;
  // xPid_->reset_integral();
  // yPid_->reset_integral();
  // thetaPid_->reset_integral();
  tf2::Quaternion tmpQuat;
  tmpQuat.setRPY(roll_, pitch_, yaw_);
  while (nh_.ok()) {
    if (GetMarkerPose()<0) {
        step = 0;
    } else {
      targetTrans.rotation.x = tmpQuat.x();
      targetTrans.rotation.y = tmpQuat.y();
      targetTrans.rotation.z = tmpQuat.z();
      targetTrans.rotation.w = tmpQuat.w();
      targetPose = GetTargetAheadPose(targetTrans);
    }
    ROS_WARN("---------step:%d,err:%f",step,targetPose.angular.z);
    switch (step) {
      case 0:
        if (FindTarget() < 0) {
          res.message = "failed to find target";
          return true;
        }
        step++;
        break;
      case 1:
        if ((fabs(targetPose.linear.x) > (2.0 * req.goal_dist)) ||
            (fabs(targetPose.linear.y) > 0.1) ||
            (fabs(targetPose.angular.z) > 0.1)) {
          if (RelativeMove(targetPose.linear.x, targetPose.linear.y,
                           targetPose.angular.z) < 0) {
            res.message = "RelativeMove error";
            return true;
          }
        }
        step++;
        break;
      case 2:
        if (fabs(targetPose.angular.z) > 0.05)
          step = 4;
        else if ((fabs(targetPose.linear.x) > 0.01) ||
                 (fabs(targetPose.linear.y) > 0.01))
          step = 3;
        else
          step = 5;
        break;
      case 3:
        // velCmd.linear.x = xPid_->compute(0.0, targetPose.linear.x);
        // velCmd.linear.y = yPid_->compute(0.0, targetPose.linear.y);
        // velCmd.angular.z = 0.0;
        // velPub_.publish(velCmd);
        if (RelativeMove(targetPose.linear.x, targetPose.linear.y, 0) < 0) {
          res.message = "RelativeMove error";
          return true;
        }
        step = 2;
        break;
      case 4:
        // velCmd.linear.x = 0;
        // velCmd.linear.y = 0;
        // velCmd.angular.z = thetaPid_->compute(0.0, targetPose.angular.z);
        // velPub_.publish(velCmd);
        if (RelativeMove(0, 0, targetPose.angular.z) < 0) {
          res.message = "RelativeMove error";
          return true;
        }
        step = 2;
        break;
      case 5:
        res.success = true;
        SetFinishedFlag(true);
        // if (listenTfThread_.joinable()) listenTfThread_.join();
        return true;
        break;
    }
    loop.sleep();
  }
  return true;
}

}  // namespace rei_ar_pose
