# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "relative_move: 0 messages, 1 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(relative_move_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/bobac3/ros_ws/src/relative_move/srv/SetRelativeMove.srv" NAME_WE)
add_custom_target(_relative_move_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "relative_move" "/home/bobac3/ros_ws/src/relative_move/srv/SetRelativeMove.srv" "geometry_msgs/Pose2D"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(relative_move
  "/home/bobac3/ros_ws/src/relative_move/srv/SetRelativeMove.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/relative_move
)

### Generating Module File
_generate_module_cpp(relative_move
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/relative_move
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(relative_move_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(relative_move_generate_messages relative_move_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bobac3/ros_ws/src/relative_move/srv/SetRelativeMove.srv" NAME_WE)
add_dependencies(relative_move_generate_messages_cpp _relative_move_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(relative_move_gencpp)
add_dependencies(relative_move_gencpp relative_move_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS relative_move_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(relative_move
  "/home/bobac3/ros_ws/src/relative_move/srv/SetRelativeMove.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/relative_move
)

### Generating Module File
_generate_module_eus(relative_move
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/relative_move
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(relative_move_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(relative_move_generate_messages relative_move_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bobac3/ros_ws/src/relative_move/srv/SetRelativeMove.srv" NAME_WE)
add_dependencies(relative_move_generate_messages_eus _relative_move_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(relative_move_geneus)
add_dependencies(relative_move_geneus relative_move_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS relative_move_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(relative_move
  "/home/bobac3/ros_ws/src/relative_move/srv/SetRelativeMove.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/relative_move
)

### Generating Module File
_generate_module_lisp(relative_move
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/relative_move
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(relative_move_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(relative_move_generate_messages relative_move_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bobac3/ros_ws/src/relative_move/srv/SetRelativeMove.srv" NAME_WE)
add_dependencies(relative_move_generate_messages_lisp _relative_move_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(relative_move_genlisp)
add_dependencies(relative_move_genlisp relative_move_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS relative_move_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(relative_move
  "/home/bobac3/ros_ws/src/relative_move/srv/SetRelativeMove.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/relative_move
)

### Generating Module File
_generate_module_nodejs(relative_move
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/relative_move
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(relative_move_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(relative_move_generate_messages relative_move_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bobac3/ros_ws/src/relative_move/srv/SetRelativeMove.srv" NAME_WE)
add_dependencies(relative_move_generate_messages_nodejs _relative_move_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(relative_move_gennodejs)
add_dependencies(relative_move_gennodejs relative_move_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS relative_move_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(relative_move
  "/home/bobac3/ros_ws/src/relative_move/srv/SetRelativeMove.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/relative_move
)

### Generating Module File
_generate_module_py(relative_move
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/relative_move
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(relative_move_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(relative_move_generate_messages relative_move_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bobac3/ros_ws/src/relative_move/srv/SetRelativeMove.srv" NAME_WE)
add_dependencies(relative_move_generate_messages_py _relative_move_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(relative_move_genpy)
add_dependencies(relative_move_genpy relative_move_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS relative_move_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/relative_move)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/relative_move
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(relative_move_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/relative_move)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/relative_move
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(relative_move_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/relative_move)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/relative_move
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(relative_move_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/relative_move)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/relative_move
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(relative_move_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/relative_move)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/relative_move\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/relative_move
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(relative_move_generate_messages_py geometry_msgs_generate_messages_py)
endif()
