; Auto-generated. Do not edit!


(cl:in-package robot_audio-srv)


;//! \htmlinclude Awake-request.msg.html

(cl:defclass <Awake-request> (roslisp-msg-protocol:ros-message)
  ((text
    :reader text
    :initarg :text
    :type cl:string
    :initform ""))
)

(cl:defclass Awake-request (<Awake-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Awake-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Awake-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<Awake-request> is deprecated: use robot_audio-srv:Awake-request instead.")))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <Awake-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:text-val is deprecated.  Use robot_audio-srv:text instead.")
  (text m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Awake-request>) ostream)
  "Serializes a message object of type '<Awake-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Awake-request>) istream)
  "Deserializes a message object of type '<Awake-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Awake-request>)))
  "Returns string type for a service object of type '<Awake-request>"
  "robot_audio/AwakeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Awake-request)))
  "Returns string type for a service object of type 'Awake-request"
  "robot_audio/AwakeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Awake-request>)))
  "Returns md5sum for a message object of type '<Awake-request>"
  "346f56948fa329d395224adefd3ff2c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Awake-request)))
  "Returns md5sum for a message object of type 'Awake-request"
  "346f56948fa329d395224adefd3ff2c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Awake-request>)))
  "Returns full string definition for message of type '<Awake-request>"
  (cl:format cl:nil "string text~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Awake-request)))
  "Returns full string definition for message of type 'Awake-request"
  (cl:format cl:nil "string text~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Awake-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'text))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Awake-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Awake-request
    (cl:cons ':text (text msg))
))
;//! \htmlinclude Awake-response.msg.html

(cl:defclass <Awake-response> (roslisp-msg-protocol:ros-message)
  ((awake_flag
    :reader awake_flag
    :initarg :awake_flag
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Awake-response (<Awake-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Awake-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Awake-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<Awake-response> is deprecated: use robot_audio-srv:Awake-response instead.")))

(cl:ensure-generic-function 'awake_flag-val :lambda-list '(m))
(cl:defmethod awake_flag-val ((m <Awake-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:awake_flag-val is deprecated.  Use robot_audio-srv:awake_flag instead.")
  (awake_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Awake-response>) ostream)
  "Serializes a message object of type '<Awake-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'awake_flag) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Awake-response>) istream)
  "Deserializes a message object of type '<Awake-response>"
    (cl:setf (cl:slot-value msg 'awake_flag) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Awake-response>)))
  "Returns string type for a service object of type '<Awake-response>"
  "robot_audio/AwakeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Awake-response)))
  "Returns string type for a service object of type 'Awake-response"
  "robot_audio/AwakeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Awake-response>)))
  "Returns md5sum for a message object of type '<Awake-response>"
  "346f56948fa329d395224adefd3ff2c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Awake-response)))
  "Returns md5sum for a message object of type 'Awake-response"
  "346f56948fa329d395224adefd3ff2c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Awake-response>)))
  "Returns full string definition for message of type '<Awake-response>"
  (cl:format cl:nil "bool awake_flag~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Awake-response)))
  "Returns full string definition for message of type 'Awake-response"
  (cl:format cl:nil "bool awake_flag~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Awake-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Awake-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Awake-response
    (cl:cons ':awake_flag (awake_flag msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Awake)))
  'Awake-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Awake)))
  'Awake-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Awake)))
  "Returns string type for a service object of type '<Awake>"
  "robot_audio/Awake")