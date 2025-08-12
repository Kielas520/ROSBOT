; Auto-generated. Do not edit!


(cl:in-package robot_audio-srv)


;//! \htmlinclude robot_tts-request.msg.html

(cl:defclass <robot_tts-request> (roslisp-msg-protocol:ros-message)
  ((text
    :reader text
    :initarg :text
    :type cl:string
    :initform "")
   (play
    :reader play
    :initarg :play
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass robot_tts-request (<robot_tts-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_tts-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_tts-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<robot_tts-request> is deprecated: use robot_audio-srv:robot_tts-request instead.")))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <robot_tts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:text-val is deprecated.  Use robot_audio-srv:text instead.")
  (text m))

(cl:ensure-generic-function 'play-val :lambda-list '(m))
(cl:defmethod play-val ((m <robot_tts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:play-val is deprecated.  Use robot_audio-srv:play instead.")
  (play m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_tts-request>) ostream)
  "Serializes a message object of type '<robot_tts-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'play) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_tts-request>) istream)
  "Deserializes a message object of type '<robot_tts-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'play) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_tts-request>)))
  "Returns string type for a service object of type '<robot_tts-request>"
  "robot_audio/robot_ttsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_tts-request)))
  "Returns string type for a service object of type 'robot_tts-request"
  "robot_audio/robot_ttsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_tts-request>)))
  "Returns md5sum for a message object of type '<robot_tts-request>"
  "2ad2a7e28f20ec853b183153ee6b6d2d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_tts-request)))
  "Returns md5sum for a message object of type 'robot_tts-request"
  "2ad2a7e28f20ec853b183153ee6b6d2d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_tts-request>)))
  "Returns full string definition for message of type '<robot_tts-request>"
  (cl:format cl:nil "string text~%bool play~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_tts-request)))
  "Returns full string definition for message of type 'robot_tts-request"
  (cl:format cl:nil "string text~%bool play~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_tts-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'text))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_tts-request>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_tts-request
    (cl:cons ':text (text msg))
    (cl:cons ':play (play msg))
))
;//! \htmlinclude robot_tts-response.msg.html

(cl:defclass <robot_tts-response> (roslisp-msg-protocol:ros-message)
  ((audiopath
    :reader audiopath
    :initarg :audiopath
    :type cl:string
    :initform ""))
)

(cl:defclass robot_tts-response (<robot_tts-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_tts-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_tts-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<robot_tts-response> is deprecated: use robot_audio-srv:robot_tts-response instead.")))

(cl:ensure-generic-function 'audiopath-val :lambda-list '(m))
(cl:defmethod audiopath-val ((m <robot_tts-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:audiopath-val is deprecated.  Use robot_audio-srv:audiopath instead.")
  (audiopath m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_tts-response>) ostream)
  "Serializes a message object of type '<robot_tts-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'audiopath))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'audiopath))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_tts-response>) istream)
  "Deserializes a message object of type '<robot_tts-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_tts-response>)))
  "Returns string type for a service object of type '<robot_tts-response>"
  "robot_audio/robot_ttsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_tts-response)))
  "Returns string type for a service object of type 'robot_tts-response"
  "robot_audio/robot_ttsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_tts-response>)))
  "Returns md5sum for a message object of type '<robot_tts-response>"
  "2ad2a7e28f20ec853b183153ee6b6d2d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_tts-response)))
  "Returns md5sum for a message object of type 'robot_tts-response"
  "2ad2a7e28f20ec853b183153ee6b6d2d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_tts-response>)))
  "Returns full string definition for message of type '<robot_tts-response>"
  (cl:format cl:nil "string audiopath~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_tts-response)))
  "Returns full string definition for message of type 'robot_tts-response"
  (cl:format cl:nil "string audiopath~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_tts-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'audiopath))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_tts-response>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_tts-response
    (cl:cons ':audiopath (audiopath msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'robot_tts)))
  'robot_tts-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'robot_tts)))
  'robot_tts-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_tts)))
  "Returns string type for a service object of type '<robot_tts>"
  "robot_audio/robot_tts")