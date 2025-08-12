; Auto-generated. Do not edit!


(cl:in-package robot_audio-srv)


;//! \htmlinclude Collect-request.msg.html

(cl:defclass <Collect-request> (roslisp-msg-protocol:ros-message)
  ((collect_flag
    :reader collect_flag
    :initarg :collect_flag
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Collect-request (<Collect-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Collect-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Collect-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<Collect-request> is deprecated: use robot_audio-srv:Collect-request instead.")))

(cl:ensure-generic-function 'collect_flag-val :lambda-list '(m))
(cl:defmethod collect_flag-val ((m <Collect-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:collect_flag-val is deprecated.  Use robot_audio-srv:collect_flag instead.")
  (collect_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Collect-request>) ostream)
  "Serializes a message object of type '<Collect-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'collect_flag) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Collect-request>) istream)
  "Deserializes a message object of type '<Collect-request>"
    (cl:setf (cl:slot-value msg 'collect_flag) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Collect-request>)))
  "Returns string type for a service object of type '<Collect-request>"
  "robot_audio/CollectRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Collect-request)))
  "Returns string type for a service object of type 'Collect-request"
  "robot_audio/CollectRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Collect-request>)))
  "Returns md5sum for a message object of type '<Collect-request>"
  "10ccb23b7c8752a359f2fdb188e7b775")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Collect-request)))
  "Returns md5sum for a message object of type 'Collect-request"
  "10ccb23b7c8752a359f2fdb188e7b775")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Collect-request>)))
  "Returns full string definition for message of type '<Collect-request>"
  (cl:format cl:nil "bool collect_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Collect-request)))
  "Returns full string definition for message of type 'Collect-request"
  (cl:format cl:nil "bool collect_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Collect-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Collect-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Collect-request
    (cl:cons ':collect_flag (collect_flag msg))
))
;//! \htmlinclude Collect-response.msg.html

(cl:defclass <Collect-response> (roslisp-msg-protocol:ros-message)
  ((voice_filename
    :reader voice_filename
    :initarg :voice_filename
    :type cl:string
    :initform ""))
)

(cl:defclass Collect-response (<Collect-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Collect-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Collect-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<Collect-response> is deprecated: use robot_audio-srv:Collect-response instead.")))

(cl:ensure-generic-function 'voice_filename-val :lambda-list '(m))
(cl:defmethod voice_filename-val ((m <Collect-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:voice_filename-val is deprecated.  Use robot_audio-srv:voice_filename instead.")
  (voice_filename m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Collect-response>) ostream)
  "Serializes a message object of type '<Collect-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'voice_filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'voice_filename))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Collect-response>) istream)
  "Deserializes a message object of type '<Collect-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'voice_filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'voice_filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Collect-response>)))
  "Returns string type for a service object of type '<Collect-response>"
  "robot_audio/CollectResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Collect-response)))
  "Returns string type for a service object of type 'Collect-response"
  "robot_audio/CollectResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Collect-response>)))
  "Returns md5sum for a message object of type '<Collect-response>"
  "10ccb23b7c8752a359f2fdb188e7b775")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Collect-response)))
  "Returns md5sum for a message object of type 'Collect-response"
  "10ccb23b7c8752a359f2fdb188e7b775")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Collect-response>)))
  "Returns full string definition for message of type '<Collect-response>"
  (cl:format cl:nil "string voice_filename~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Collect-response)))
  "Returns full string definition for message of type 'Collect-response"
  (cl:format cl:nil "string voice_filename~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Collect-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'voice_filename))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Collect-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Collect-response
    (cl:cons ':voice_filename (voice_filename msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Collect)))
  'Collect-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Collect)))
  'Collect-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Collect)))
  "Returns string type for a service object of type '<Collect>"
  "robot_audio/Collect")