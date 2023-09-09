# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ece642rtle: 4 messages, 4 services")

set(MSG_I_FLAGS "-Iece642rtle:/home/student/catkin_ws/src/ece642rtle/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ece642rtle_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/timeInt8.msg" NAME_WE)
add_custom_target(_ece642rtle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ece642rtle" "/home/student/catkin_ws/src/ece642rtle/msg/timeInt8.msg" ""
)

get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/Spawn.srv" NAME_WE)
add_custom_target(_ece642rtle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ece642rtle" "/home/student/catkin_ws/src/ece642rtle/srv/Spawn.srv" ""
)

get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/bumpEcho.msg" NAME_WE)
add_custom_target(_ece642rtle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ece642rtle" "/home/student/catkin_ws/src/ece642rtle/msg/bumpEcho.msg" ""
)

get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/Kill.srv" NAME_WE)
add_custom_target(_ece642rtle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ece642rtle" "/home/student/catkin_ws/src/ece642rtle/srv/Kill.srv" ""
)

get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/aendEcho.msg" NAME_WE)
add_custom_target(_ece642rtle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ece642rtle" "/home/student/catkin_ws/src/ece642rtle/msg/aendEcho.msg" ""
)

get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/RTIbump.srv" NAME_WE)
add_custom_target(_ece642rtle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ece642rtle" "/home/student/catkin_ws/src/ece642rtle/srv/RTIbump.srv" ""
)

get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/PoseOrntBundle.msg" NAME_WE)
add_custom_target(_ece642rtle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ece642rtle" "/home/student/catkin_ws/src/ece642rtle/msg/PoseOrntBundle.msg" ""
)

get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/RTIatend.srv" NAME_WE)
add_custom_target(_ece642rtle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ece642rtle" "/home/student/catkin_ws/src/ece642rtle/srv/RTIatend.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/aendEcho.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ece642rtle
)
_generate_msg_cpp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/timeInt8.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ece642rtle
)
_generate_msg_cpp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/PoseOrntBundle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ece642rtle
)
_generate_msg_cpp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/bumpEcho.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ece642rtle
)

### Generating Services
_generate_srv_cpp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/Kill.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ece642rtle
)
_generate_srv_cpp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/Spawn.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ece642rtle
)
_generate_srv_cpp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/RTIatend.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ece642rtle
)
_generate_srv_cpp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/RTIbump.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ece642rtle
)

### Generating Module File
_generate_module_cpp(ece642rtle
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ece642rtle
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ece642rtle_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ece642rtle_generate_messages ece642rtle_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/timeInt8.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_cpp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/Spawn.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_cpp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/bumpEcho.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_cpp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/Kill.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_cpp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/aendEcho.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_cpp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/RTIbump.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_cpp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/PoseOrntBundle.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_cpp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/RTIatend.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_cpp _ece642rtle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ece642rtle_gencpp)
add_dependencies(ece642rtle_gencpp ece642rtle_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ece642rtle_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/aendEcho.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ece642rtle
)
_generate_msg_eus(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/timeInt8.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ece642rtle
)
_generate_msg_eus(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/PoseOrntBundle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ece642rtle
)
_generate_msg_eus(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/bumpEcho.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ece642rtle
)

### Generating Services
_generate_srv_eus(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/Kill.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ece642rtle
)
_generate_srv_eus(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/Spawn.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ece642rtle
)
_generate_srv_eus(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/RTIatend.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ece642rtle
)
_generate_srv_eus(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/RTIbump.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ece642rtle
)

### Generating Module File
_generate_module_eus(ece642rtle
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ece642rtle
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ece642rtle_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ece642rtle_generate_messages ece642rtle_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/timeInt8.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_eus _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/Spawn.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_eus _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/bumpEcho.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_eus _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/Kill.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_eus _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/aendEcho.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_eus _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/RTIbump.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_eus _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/PoseOrntBundle.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_eus _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/RTIatend.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_eus _ece642rtle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ece642rtle_geneus)
add_dependencies(ece642rtle_geneus ece642rtle_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ece642rtle_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/aendEcho.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ece642rtle
)
_generate_msg_lisp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/timeInt8.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ece642rtle
)
_generate_msg_lisp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/PoseOrntBundle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ece642rtle
)
_generate_msg_lisp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/bumpEcho.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ece642rtle
)

### Generating Services
_generate_srv_lisp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/Kill.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ece642rtle
)
_generate_srv_lisp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/Spawn.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ece642rtle
)
_generate_srv_lisp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/RTIatend.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ece642rtle
)
_generate_srv_lisp(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/RTIbump.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ece642rtle
)

### Generating Module File
_generate_module_lisp(ece642rtle
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ece642rtle
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ece642rtle_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ece642rtle_generate_messages ece642rtle_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/timeInt8.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_lisp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/Spawn.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_lisp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/bumpEcho.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_lisp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/Kill.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_lisp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/aendEcho.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_lisp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/RTIbump.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_lisp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/PoseOrntBundle.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_lisp _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/RTIatend.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_lisp _ece642rtle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ece642rtle_genlisp)
add_dependencies(ece642rtle_genlisp ece642rtle_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ece642rtle_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/aendEcho.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ece642rtle
)
_generate_msg_nodejs(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/timeInt8.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ece642rtle
)
_generate_msg_nodejs(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/PoseOrntBundle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ece642rtle
)
_generate_msg_nodejs(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/bumpEcho.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ece642rtle
)

### Generating Services
_generate_srv_nodejs(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/Kill.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ece642rtle
)
_generate_srv_nodejs(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/Spawn.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ece642rtle
)
_generate_srv_nodejs(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/RTIatend.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ece642rtle
)
_generate_srv_nodejs(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/RTIbump.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ece642rtle
)

### Generating Module File
_generate_module_nodejs(ece642rtle
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ece642rtle
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ece642rtle_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ece642rtle_generate_messages ece642rtle_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/timeInt8.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_nodejs _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/Spawn.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_nodejs _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/bumpEcho.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_nodejs _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/Kill.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_nodejs _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/aendEcho.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_nodejs _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/RTIbump.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_nodejs _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/PoseOrntBundle.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_nodejs _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/RTIatend.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_nodejs _ece642rtle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ece642rtle_gennodejs)
add_dependencies(ece642rtle_gennodejs ece642rtle_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ece642rtle_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/aendEcho.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ece642rtle
)
_generate_msg_py(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/timeInt8.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ece642rtle
)
_generate_msg_py(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/PoseOrntBundle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ece642rtle
)
_generate_msg_py(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/msg/bumpEcho.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ece642rtle
)

### Generating Services
_generate_srv_py(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/Kill.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ece642rtle
)
_generate_srv_py(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/Spawn.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ece642rtle
)
_generate_srv_py(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/RTIatend.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ece642rtle
)
_generate_srv_py(ece642rtle
  "/home/student/catkin_ws/src/ece642rtle/srv/RTIbump.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ece642rtle
)

### Generating Module File
_generate_module_py(ece642rtle
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ece642rtle
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ece642rtle_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ece642rtle_generate_messages ece642rtle_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/timeInt8.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_py _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/Spawn.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_py _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/bumpEcho.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_py _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/Kill.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_py _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/aendEcho.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_py _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/RTIbump.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_py _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/msg/PoseOrntBundle.msg" NAME_WE)
add_dependencies(ece642rtle_generate_messages_py _ece642rtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/ece642rtle/srv/RTIatend.srv" NAME_WE)
add_dependencies(ece642rtle_generate_messages_py _ece642rtle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ece642rtle_genpy)
add_dependencies(ece642rtle_genpy ece642rtle_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ece642rtle_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ece642rtle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ece642rtle
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(ece642rtle_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ece642rtle_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET std_srvs_generate_messages_cpp)
  add_dependencies(ece642rtle_generate_messages_cpp std_srvs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ece642rtle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ece642rtle
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(ece642rtle_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ece642rtle_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET std_srvs_generate_messages_eus)
  add_dependencies(ece642rtle_generate_messages_eus std_srvs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ece642rtle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ece642rtle
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(ece642rtle_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ece642rtle_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET std_srvs_generate_messages_lisp)
  add_dependencies(ece642rtle_generate_messages_lisp std_srvs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ece642rtle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ece642rtle
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(ece642rtle_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ece642rtle_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET std_srvs_generate_messages_nodejs)
  add_dependencies(ece642rtle_generate_messages_nodejs std_srvs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ece642rtle)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ece642rtle\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ece642rtle
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(ece642rtle_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ece642rtle_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET std_srvs_generate_messages_py)
  add_dependencies(ece642rtle_generate_messages_py std_srvs_generate_messages_py)
endif()
