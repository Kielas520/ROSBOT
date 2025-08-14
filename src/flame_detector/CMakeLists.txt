cmake_minimum_required(VERSION 3.0.2)
project(flame_detector)

find_package(catkin REQUIRED COMPONENTS
  rospy
  sensor_msgs
  std_msgs
  cv_bridge
)

catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
)

catkin_install_python(PROGRAMS
  scripts/flame_detector_node.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)