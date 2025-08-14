cmake_minimum_required(VERSION 3.0.2)
project(flame_detector)

find_package(catkin REQUIRED COMPONENTS
  rospy
  sensor_msgs
  std_msgs
  cv_bridge
  message_generation
)

# 生成服务文件
add_service_files(
  FILES
  DetectFlame.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
  sensor_msgs
)

catkin_package(
  CATKIN_DEPENDS message_runtime
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

catkin_install_python(PROGRAMS
  scripts/flame_detector_node.py
  scripts/flame_detector_service.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)