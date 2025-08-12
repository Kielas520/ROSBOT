; Auto-generated. Do not edit!


(cl:in-package robot_audio-srv)


;//! \htmlinclude Nav-request.msg.html

(cl:defclass <Nav-request> (roslisp-msg-protocol:ros-message)
  ((nav_order
    :reader nav_order
    :initarg :nav_order
    :type cl:string
    :initform ""))
)

(cl:defclass Nav-request (<Nav-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Nav-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Nav-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<Nav-request> is deprecated: use robot_audio-srv:Nav-request instead.")))

(cl:ensure-generic-function 'nav_order-val :lambda-list '(m))
(cl:defmethod nav_order-val ((m <Nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:nav_order-val is deprecated.  Use robot_audio-srv:nav_order instead.")
  (nav_order m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Nav-request>) ostream)
  "Serializes a message object of type '<Nav-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'nav_order))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'nav_order))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Nav-request>) istream)
  "Deserializes a message object of type '<Nav-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nav_order) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'nav_order) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Nav-request>)))
  "Returns string type for a service object of type '<Nav-request>"
  "robot_audio/NavRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nav-request)))
  "Returns string type for a service object of type 'Nav-request"
  "robot_audio/NavRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Nav-request>)))
  "Returns md5sum for a message object of type '<Nav-request>"
  "a5777d99dbd597cc68511d66738b3956")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Nav-request)))
  "Returns md5sum for a message object of type 'Nav-request"
  "a5777d99dbd597cc68511d66738b3956")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Nav-request>)))
  "Returns full string definition for message of type '<Nav-request>"
  (cl:format cl:nil "string nav_order~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Nav-request)))
  "Returns full string definition for message of type 'Nav-request"
  (cl:format cl:nil "string nav_order~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Nav-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'nav_order))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Nav-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Nav-request
    (cl:cons ':nav_order (nav_order msg))
))
;//! \htmlinclude Nav-response.msg.html

(cl:defclass <Nav-response> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type cl:string
    :initform ""))
)

(cl:defclass Nav-response (<Nav-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Nav-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Nav-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<Nav-response> is deprecated: use robot_audio-srv:Nav-response instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <Nav-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:position-val is deprecated.  Use robot_audio-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Nav-response>) ostream)
  "Serializes a message object of type '<Nav-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Nav-response>) istream)
  "Deserializes a message object of type '<Nav-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'position) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'position) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Nav-response>)))
  "Returns string type for a service object of type '<Nav-response>"
  "robot_audio/NavResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nav-response)))
  "Returns string type for a service object of type 'Nav-response"
  "robot_audio/NavResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Nav-response>)))
  "Returns md5sum for a message object of type '<Nav-response>"
  "a5777d99dbd597cc68511d66738b3956")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Nav-response)))
  "Returns md5sum for a message object of type 'Nav-response"
  "a5777d99dbd597cc68511d66738b3956")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Nav-response>)))
  "Returns full string definition for message of type '<Nav-response>"
  (cl:format cl:nil "string position~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Nav-response)))
  "Returns full string definition for message of type 'Nav-response"
  (cl:format cl:nil "string position~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Nav-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Nav-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Nav-response
    (cl:cons ':position (position msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Nav)))
  'Nav-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Nav)))
  'Nav-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nav)))
  "Returns string type for a service object of type '<Nav>"
  "robot_audio/Nav")