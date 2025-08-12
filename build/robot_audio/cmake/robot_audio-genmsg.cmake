# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robot_audio: 0 messages, 8 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robot_audio_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_iat.srv" NAME_WE)
add_custom_target(_robot_audio_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_audio" "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_iat.srv" ""
)

get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_semanteme.srv" NAME_WE)
add_custom_target(_robot_audio_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_audio" "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_semanteme.srv" ""
)

get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_tts.srv" NAME_WE)
add_custom_target(_robot_audio_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_audio" "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_tts.srv" ""
)

get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Collect.srv" NAME_WE)
add_custom_target(_robot_audio_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_audio" "/home/reicom2025/ros_workspace/src/robot_audio/srv/Collect.srv" ""
)

get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Awake.srv" NAME_WE)
add_custom_target(_robot_audio_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_audio" "/home/reicom2025/ros_workspace/src/robot_audio/srv/Awake.srv" ""
)

get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Control.srv" NAME_WE)
add_custom_target(_robot_audio_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_audio" "/home/reicom2025/ros_workspace/src/robot_audio/srv/Control.srv" ""
)

get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Nav.srv" NAME_WE)
add_custom_target(_robot_audio_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_audio" "/home/reicom2025/ros_workspace/src/robot_audio/srv/Nav.srv" ""
)

get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/up_sync.srv" NAME_WE)
add_custom_target(_robot_audio_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_audio" "/home/reicom2025/ros_workspace/src/robot_audio/srv/up_sync.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_iat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_audio
)
_generate_srv_cpp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_semanteme.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_audio
)
_generate_srv_cpp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_tts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_audio
)
_generate_srv_cpp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Collect.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_audio
)
_generate_srv_cpp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Awake.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_audio
)
_generate_srv_cpp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_audio
)
_generate_srv_cpp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Nav.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_audio
)
_generate_srv_cpp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/up_sync.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_audio
)

### Generating Module File
_generate_module_cpp(robot_audio
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_audio
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robot_audio_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robot_audio_generate_messages robot_audio_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_iat.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_cpp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_semanteme.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_cpp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_tts.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_cpp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Collect.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_cpp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Awake.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_cpp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Control.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_cpp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Nav.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_cpp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/up_sync.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_cpp _robot_audio_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_audio_gencpp)
add_dependencies(robot_audio_gencpp robot_audio_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_audio_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_iat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_audio
)
_generate_srv_eus(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_semanteme.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_audio
)
_generate_srv_eus(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_tts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_audio
)
_generate_srv_eus(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Collect.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_audio
)
_generate_srv_eus(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Awake.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_audio
)
_generate_srv_eus(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_audio
)
_generate_srv_eus(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Nav.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_audio
)
_generate_srv_eus(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/up_sync.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_audio
)

### Generating Module File
_generate_module_eus(robot_audio
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_audio
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(robot_audio_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(robot_audio_generate_messages robot_audio_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_iat.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_eus _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_semanteme.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_eus _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_tts.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_eus _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Collect.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_eus _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Awake.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_eus _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Control.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_eus _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Nav.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_eus _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/up_sync.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_eus _robot_audio_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_audio_geneus)
add_dependencies(robot_audio_geneus robot_audio_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_audio_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_iat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_audio
)
_generate_srv_lisp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_semanteme.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_audio
)
_generate_srv_lisp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_tts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_audio
)
_generate_srv_lisp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Collect.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_audio
)
_generate_srv_lisp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Awake.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_audio
)
_generate_srv_lisp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_audio
)
_generate_srv_lisp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Nav.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_audio
)
_generate_srv_lisp(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/up_sync.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_audio
)

### Generating Module File
_generate_module_lisp(robot_audio
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_audio
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robot_audio_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robot_audio_generate_messages robot_audio_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_iat.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_lisp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_semanteme.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_lisp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_tts.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_lisp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Collect.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_lisp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Awake.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_lisp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Control.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_lisp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Nav.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_lisp _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/up_sync.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_lisp _robot_audio_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_audio_genlisp)
add_dependencies(robot_audio_genlisp robot_audio_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_audio_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_iat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_audio
)
_generate_srv_nodejs(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_semanteme.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_audio
)
_generate_srv_nodejs(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_tts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_audio
)
_generate_srv_nodejs(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Collect.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_audio
)
_generate_srv_nodejs(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Awake.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_audio
)
_generate_srv_nodejs(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_audio
)
_generate_srv_nodejs(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Nav.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_audio
)
_generate_srv_nodejs(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/up_sync.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_audio
)

### Generating Module File
_generate_module_nodejs(robot_audio
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_audio
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(robot_audio_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(robot_audio_generate_messages robot_audio_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_iat.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_nodejs _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_semanteme.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_nodejs _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_tts.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_nodejs _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Collect.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_nodejs _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Awake.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_nodejs _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Control.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_nodejs _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Nav.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_nodejs _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/up_sync.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_nodejs _robot_audio_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_audio_gennodejs)
add_dependencies(robot_audio_gennodejs robot_audio_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_audio_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_iat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_audio
)
_generate_srv_py(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_semanteme.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_audio
)
_generate_srv_py(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_tts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_audio
)
_generate_srv_py(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Collect.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_audio
)
_generate_srv_py(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Awake.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_audio
)
_generate_srv_py(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_audio
)
_generate_srv_py(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/Nav.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_audio
)
_generate_srv_py(robot_audio
  "/home/reicom2025/ros_workspace/src/robot_audio/srv/up_sync.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_audio
)

### Generating Module File
_generate_module_py(robot_audio
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_audio
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robot_audio_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robot_audio_generate_messages robot_audio_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_iat.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_py _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_semanteme.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_py _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/robot_tts.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_py _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Collect.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_py _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Awake.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_py _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Control.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_py _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/Nav.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_py _robot_audio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/reicom2025/ros_workspace/src/robot_audio/srv/up_sync.srv" NAME_WE)
add_dependencies(robot_audio_generate_messages_py _robot_audio_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_audio_genpy)
add_dependencies(robot_audio_genpy robot_audio_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_audio_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_audio)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_audio
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(robot_audio_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_audio)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_audio
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(robot_audio_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_audio)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_audio
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(robot_audio_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_audio)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_audio
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(robot_audio_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_audio)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_audio\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_audio
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(robot_audio_generate_messages_py std_msgs_generate_messages_py)
endif()
