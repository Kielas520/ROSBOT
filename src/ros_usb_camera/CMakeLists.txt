# 声明最低 CMake 版本要求
cmake_minimum_required(VERSION 3.0.2)

# 定义功能包名称
project(ros_usb_camera)

# 查找 catkin 和其他 ROS 依赖
find_package(catkin REQUIRED COMPONENTS
  roscpp
  image_transport
  cv_bridge
  std_msgs
  sensor_msgs
)

# 查找 OpenCV 库
find_package(OpenCV REQUIRED)

# 定义 catkin 功能包
catkin_package(
  CATKIN_DEPENDS roscpp image_transport cv_bridge std_msgs sensor_msgs
  DEPENDS OpenCV
)

# 包含头文件目录
include_directories(
  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
)

# 声明可执行文件 usb_camera_node
add_executable(usb_camera_node src/usb_camera_node.cpp)

# 链接库到可执行文件
target_link_libraries(usb_camera_node
  ${catkin_LIBRARIES}
  ${OpenCV_LIBRARIES}
)

# 确保依赖构建顺序
add_dependencies(usb_camera_node ${catkin_EXPORTED_TARGETS})
