cmake_minimum_required(VERSION 2.8.3)
project(ar_pose)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++14)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS 
  tf2_ros
  message_generation
  roscpp
  # pid_lib
  relative_move
)
## Generate messages in the 'msg' folder
add_message_files(
  FILES
  ArPose.msg
)

## Generate services in the 'srv' folder
add_service_files(
  FILES
  Track.srv
)

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  geometry_msgs
)


catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES ar_pose
  CATKIN_DEPENDS geometry_msgs message_runtime
#  DEPENDS system_lib
)


## Your package locations should be listed before other locations
include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

# add_executable(pose_adjust
#   src/pose_adjust.cpp
# )
add_executable(pose_adjust src/ros_node.cpp
  src/PoseAdjust.cpp
)
add_dependencies(pose_adjust ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(pose_adjust
  ${catkin_LIBRARIES}
)
## Mark executables and/or libraries for installation
install(TARGETS pose_adjust
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

## Mark other files for installation (e.g. launch and bag files, etc.)
foreach(dir launch msg srv cam_info)
	install(DIRECTORY ${dir}/
		DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/${dir})
endforeach(dir)
install(FILES
  readme.md
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
