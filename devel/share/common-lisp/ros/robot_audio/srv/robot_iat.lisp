; Auto-generated. Do not edit!


(cl:in-package robot_audio-srv)


;//! \htmlinclude robot_iat-request.msg.html

(cl:defclass <robot_iat-request> (roslisp-msg-protocol:ros-message)
  ((audiopath
    :reader audiopath
    :initarg :audiopath
    :type cl:string
    :initform ""))
)

(cl:defclass robot_iat-request (<robot_iat-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_iat-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_iat-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<robot_iat-request> is deprecated: use robot_audio-srv:robot_iat-request instead.")))

(cl:ensure-generic-function 'audiopath-val :lambda-list '(m))
(cl:defmethod audiopath-val ((m <robot_iat-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:audiopath-val is deprecated.  Use robot_audio-srv:audiopath instead.")
  (audiopath m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_iat-request>) ostream)
  "Serializes a message object of type '<robot_iat-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'audiopath))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'audiopath))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_iat-request>) istream)
  "Deserializes a message object of type '<robot_iat-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'audiopath) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'audiopath) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_iat-request>)))
  "Returns string type for a service object of type '<robot_iat-request>"
  "robot_audio/robot_iatRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_iat-request)))
  "Returns string type for a service object of type 'robot_iat-request"
  "robot_audio/robot_iatRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_iat-request>)))
  "Returns md5sum for a message object of type '<robot_iat-request>"
  "318b42904b3fd33a38a273170db5f135")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_iat-request)))
  "Returns md5sum for a message object of type 'robot_iat-request"
  "318b42904b3fd33a38a273170db5f135")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_iat-request>)))
  "Returns full string definition for message of type '<robot_iat-request>"
  (cl:format cl:nil "string audiopath~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_iat-request)))
  "Returns full string definition for message of type 'robot_iat-request"
  (cl:format cl:nil "string audiopath~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_iat-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'audiopath))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_iat-request>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_iat-request
    (cl:cons ':audiopath (audiopath msg))
))
;//! \htmlinclude robot_iat-response.msg.html

(cl:defclass <robot_iat-response> (roslisp-msg-protocol:ros-message)
  ((text
    :reader text
    :initarg :text
    :type cl:string
    :initform ""))
)

(cl:defclass robot_iat-response (<robot_iat-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_iat-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_iat-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<robot_iat-response> is deprecated: use robot_audio-srv:robot_iat-response instead.")))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <robot_iat-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:text-val is deprecated.  Use robot_audio-srv:text instead.")
  (text m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_iat-response>) ostream)
  "Serializes a message object of type '<robot_iat-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_iat-response>) istream)
  "Deserializes a message object of type '<robot_iat-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_iat-response>)))
  "Returns string type for a service object of type '<robot_iat-response>"
  "robot_audio/robot_iatResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_iat-response)))
  "Returns string type for a service object of type 'robot_iat-response"
  "robot_audio/robot_iatResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_iat-response>)))
  "Returns md5sum for a message object of type '<robot_iat-response>"
  "318b42904b3fd33a38a273170db5f135")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_iat-response)))
  "Returns md5sum for a message object of type 'robot_iat-response"
  "318b42904b3fd33a38a273170db5f135")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_iat-response>)))
  "Returns full string definition for message of type '<robot_iat-response>"
  (cl:format cl:nil "string text~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_iat-response)))
  "Returns full string definition for message of type 'robot_iat-response"
  (cl:format cl:nil "string text~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_iat-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'text))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_iat-response>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_iat-response
    (cl:cons ':text (text msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'robot_iat)))
  'robot_iat-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'robot_iat)))
  'robot_iat-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_iat)))
  "Returns string type for a service object of type '<robot_iat>"
  "robot_audio/robot_iat")