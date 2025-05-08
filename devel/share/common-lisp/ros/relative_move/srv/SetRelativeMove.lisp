; Auto-generated. Do not edit!


(cl:in-package relative_move-srv)


;//! \htmlinclude SetRelativeMove-request.msg.html

(cl:defclass <SetRelativeMove-request> (roslisp-msg-protocol:ros-message)
  ((goal
    :reader goal
    :initarg :goal
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D))
   (global_frame
    :reader global_frame
    :initarg :global_frame
    :type cl:string
    :initform "")
   (avoid_obstacle
    :reader avoid_obstacle
    :initarg :avoid_obstacle
    :type cl:boolean
    :initform cl:nil)
   (finishStopObstacle
    :reader finishStopObstacle
    :initarg :finishStopObstacle
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetRelativeMove-request (<SetRelativeMove-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetRelativeMove-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetRelativeMove-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name relative_move-srv:<SetRelativeMove-request> is deprecated: use relative_move-srv:SetRelativeMove-request instead.")))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <SetRelativeMove-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader relative_move-srv:goal-val is deprecated.  Use relative_move-srv:goal instead.")
  (goal m))

(cl:ensure-generic-function 'global_frame-val :lambda-list '(m))
(cl:defmethod global_frame-val ((m <SetRelativeMove-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader relative_move-srv:global_frame-val is deprecated.  Use relative_move-srv:global_frame instead.")
  (global_frame m))

(cl:ensure-generic-function 'avoid_obstacle-val :lambda-list '(m))
(cl:defmethod avoid_obstacle-val ((m <SetRelativeMove-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader relative_move-srv:avoid_obstacle-val is deprecated.  Use relative_move-srv:avoid_obstacle instead.")
  (avoid_obstacle m))

(cl:ensure-generic-function 'finishStopObstacle-val :lambda-list '(m))
(cl:defmethod finishStopObstacle-val ((m <SetRelativeMove-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader relative_move-srv:finishStopObstacle-val is deprecated.  Use relative_move-srv:finishStopObstacle instead.")
  (finishStopObstacle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetRelativeMove-request>) ostream)
  "Serializes a message object of type '<SetRelativeMove-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'global_frame))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'global_frame))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'avoid_obstacle) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finishStopObstacle) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetRelativeMove-request>) istream)
  "Deserializes a message object of type '<SetRelativeMove-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'global_frame) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'global_frame) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'avoid_obstacle) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'finishStopObstacle) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetRelativeMove-request>)))
  "Returns string type for a service object of type '<SetRelativeMove-request>"
  "relative_move/SetRelativeMoveRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetRelativeMove-request)))
  "Returns string type for a service object of type 'SetRelativeMove-request"
  "relative_move/SetRelativeMoveRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetRelativeMove-request>)))
  "Returns md5sum for a message object of type '<SetRelativeMove-request>"
  "2f55ab509885410fe15bd79d5cf0ed25")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetRelativeMove-request)))
  "Returns md5sum for a message object of type 'SetRelativeMove-request"
  "2f55ab509885410fe15bd79d5cf0ed25")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetRelativeMove-request>)))
  "Returns full string definition for message of type '<SetRelativeMove-request>"
  (cl:format cl:nil "geometry_msgs/Pose2D goal~%string global_frame #map odom~%bool avoid_obstacle~%bool finishStopObstacle #停障碍时是否直接结束~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetRelativeMove-request)))
  "Returns full string definition for message of type 'SetRelativeMove-request"
  (cl:format cl:nil "geometry_msgs/Pose2D goal~%string global_frame #map odom~%bool avoid_obstacle~%bool finishStopObstacle #停障碍时是否直接结束~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetRelativeMove-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
     4 (cl:length (cl:slot-value msg 'global_frame))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetRelativeMove-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetRelativeMove-request
    (cl:cons ':goal (goal msg))
    (cl:cons ':global_frame (global_frame msg))
    (cl:cons ':avoid_obstacle (avoid_obstacle msg))
    (cl:cons ':finishStopObstacle (finishStopObstacle msg))
))
;//! \htmlinclude SetRelativeMove-response.msg.html

(cl:defclass <SetRelativeMove-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass SetRelativeMove-response (<SetRelativeMove-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetRelativeMove-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetRelativeMove-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name relative_move-srv:<SetRelativeMove-response> is deprecated: use relative_move-srv:SetRelativeMove-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetRelativeMove-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader relative_move-srv:success-val is deprecated.  Use relative_move-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetRelativeMove-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader relative_move-srv:message-val is deprecated.  Use relative_move-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetRelativeMove-response>) ostream)
  "Serializes a message object of type '<SetRelativeMove-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetRelativeMove-response>) istream)
  "Deserializes a message object of type '<SetRelativeMove-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetRelativeMove-response>)))
  "Returns string type for a service object of type '<SetRelativeMove-response>"
  "relative_move/SetRelativeMoveResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetRelativeMove-response)))
  "Returns string type for a service object of type 'SetRelativeMove-response"
  "relative_move/SetRelativeMoveResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetRelativeMove-response>)))
  "Returns md5sum for a message object of type '<SetRelativeMove-response>"
  "2f55ab509885410fe15bd79d5cf0ed25")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetRelativeMove-response)))
  "Returns md5sum for a message object of type 'SetRelativeMove-response"
  "2f55ab509885410fe15bd79d5cf0ed25")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetRelativeMove-response>)))
  "Returns full string definition for message of type '<SetRelativeMove-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetRelativeMove-response)))
  "Returns full string definition for message of type 'SetRelativeMove-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetRelativeMove-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetRelativeMove-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetRelativeMove-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetRelativeMove)))
  'SetRelativeMove-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetRelativeMove)))
  'SetRelativeMove-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetRelativeMove)))
  "Returns string type for a service object of type '<SetRelativeMove>"
  "relative_move/SetRelativeMove")