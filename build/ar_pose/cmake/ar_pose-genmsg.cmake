# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ar_pose: 1 messages, 1 services")

set(MSG_I_FLAGS "-Iar_pose:/home/bobac3/ros_ws/src/ar_pose/msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ar_pose_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/bobac3/ros_ws/src/ar_pose/srv/Track.srv" NAME_WE)
add_custom_target(_ar_pose_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ar_pose" "/home/bobac3/ros_ws/src/ar_pose/srv/Track.srv" ""
)

get_filename_component(_filename "/home/bobac3/ros_ws/src/ar_pose/msg/ArPose.msg" NAME_WE)
add_custom_target(_ar_pose_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ar_pose" "/home/bobac3/ros_ws/src/ar_pose/msg/ArPose.msg" "geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ar_pose
  "/home/bobac3/ros_ws/src/ar_pose/msg/ArPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ar_pose
)

### Generating Services
_generate_srv_cpp(ar_pose
  "/home/bobac3/ros_ws/src/ar_pose/srv/Track.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ar_pose
)

### Generating Module File
_generate_module_cpp(ar_pose
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ar_pose
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ar_pose_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ar_pose_generate_messages ar_pose_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bobac3/ros_ws/src/ar_pose/srv/Track.srv" NAME_WE)
add_dependencies(ar_pose_generate_messages_cpp _ar_pose_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bobac3/ros_ws/src/ar_pose/msg/ArPose.msg" NAME_WE)
add_dependencies(ar_pose_generate_messages_cpp _ar_pose_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ar_pose_gencpp)
add_dependencies(ar_pose_gencpp ar_pose_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ar_pose_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ar_pose
  "/home/bobac3/ros_ws/src/ar_pose/msg/ArPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ar_pose
)

### Generating Services
_generate_srv_eus(ar_pose
  "/home/bobac3/ros_ws/src/ar_pose/srv/Track.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ar_pose
)

### Generating Module File
_generate_module_eus(ar_pose
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ar_pose
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ar_pose_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ar_pose_generate_messages ar_pose_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bobac3/ros_ws/src/ar_pose/srv/Track.srv" NAME_WE)
add_dependencies(ar_pose_generate_messages_eus _ar_pose_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bobac3/ros_ws/src/ar_pose/msg/ArPose.msg" NAME_WE)
add_dependencies(ar_pose_generate_messages_eus _ar_pose_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ar_pose_geneus)
add_dependencies(ar_pose_geneus ar_pose_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ar_pose_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ar_pose
  "/home/bobac3/ros_ws/src/ar_pose/msg/ArPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ar_pose
)

### Generating Services
_generate_srv_lisp(ar_pose
  "/home/bobac3/ros_ws/src/ar_pose/srv/Track.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ar_pose
)

### Generating Module File
_generate_module_lisp(ar_pose
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ar_pose
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ar_pose_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ar_pose_generate_messages ar_pose_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bobac3/ros_ws/src/ar_pose/srv/Track.srv" NAME_WE)
add_dependencies(ar_pose_generate_messages_lisp _ar_pose_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bobac3/ros_ws/src/ar_pose/msg/ArPose.msg" NAME_WE)
add_dependencies(ar_pose_generate_messages_lisp _ar_pose_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ar_pose_genlisp)
add_dependencies(ar_pose_genlisp ar_pose_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ar_pose_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ar_pose
  "/home/bobac3/ros_ws/src/ar_pose/msg/ArPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ar_pose
)

### Generating Services
_generate_srv_nodejs(ar_pose
  "/home/bobac3/ros_ws/src/ar_pose/srv/Track.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ar_pose
)

### Generating Module File
_generate_module_nodejs(ar_pose
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ar_pose
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ar_pose_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ar_pose_generate_messages ar_pose_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bobac3/ros_ws/src/ar_pose/srv/Track.srv" NAME_WE)
add_dependencies(ar_pose_generate_messages_nodejs _ar_pose_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bobac3/ros_ws/src/ar_pose/msg/ArPose.msg" NAME_WE)
add_dependencies(ar_pose_generate_messages_nodejs _ar_pose_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ar_pose_gennodejs)
add_dependencies(ar_pose_gennodejs ar_pose_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ar_pose_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ar_pose
  "/home/bobac3/ros_ws/src/ar_pose/msg/ArPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ar_pose
)

### Generating Services
_generate_srv_py(ar_pose
  "/home/bobac3/ros_ws/src/ar_pose/srv/Track.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ar_pose
)

### Generating Module File
_generate_module_py(ar_pose
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ar_pose
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ar_pose_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ar_pose_generate_messages ar_pose_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bobac3/ros_ws/src/ar_pose/srv/Track.srv" NAME_WE)
add_dependencies(ar_pose_generate_messages_py _ar_pose_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bobac3/ros_ws/src/ar_pose/msg/ArPose.msg" NAME_WE)
add_dependencies(ar_pose_generate_messages_py _ar_pose_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ar_pose_genpy)
add_dependencies(ar_pose_genpy ar_pose_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ar_pose_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ar_pose)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ar_pose
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(ar_pose_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ar_pose)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ar_pose
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(ar_pose_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ar_pose)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ar_pose
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(ar_pose_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ar_pose)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ar_pose
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(ar_pose_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ar_pose)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ar_pose\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ar_pose
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(ar_pose_generate_messages_py geometry_msgs_generate_messages_py)
endif()
