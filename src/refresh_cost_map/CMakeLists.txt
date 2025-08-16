cmake_minimum_required(VERSION 3.0.2)
project(refresh_cost_map)
find_package(catkin REQUIRED COMPONENTS rospy dynamic_reconfigure)
catkin_package()
catkin_install_python(PROGRAMS scripts/refresh_cost_map_node.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})