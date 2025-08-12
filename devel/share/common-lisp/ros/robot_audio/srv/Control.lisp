; Auto-generated. Do not edit!


(cl:in-package robot_audio-srv)


;//! \htmlinclude Control-request.msg.html

(cl:defclass <Control-request> (roslisp-msg-protocol:ros-message)
  ((controlInfo
    :reader controlInfo
    :initarg :controlInfo
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (value
    :reader value
    :initarg :value
    :type cl:float
    :initform 0.0))
)

(cl:defclass Control-request (<Control-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Control-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Control-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<Control-request> is deprecated: use robot_audio-srv:Control-request instead.")))

(cl:ensure-generic-function 'controlInfo-val :lambda-list '(m))
(cl:defmethod controlInfo-val ((m <Control-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:controlInfo-val is deprecated.  Use robot_audio-srv:controlInfo instead.")
  (controlInfo m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <Control-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:value-val is deprecated.  Use robot_audio-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Control-request>) ostream)
  "Serializes a message object of type '<Control-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'controlInfo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'controlInfo))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Control-request>) istream)
  "Deserializes a message object of type '<Control-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'controlInfo) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'controlInfo)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'value) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Control-request>)))
  "Returns string type for a service object of type '<Control-request>"
  "robot_audio/ControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Control-request)))
  "Returns string type for a service object of type 'Control-request"
  "robot_audio/ControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Control-request>)))
  "Returns md5sum for a message object of type '<Control-request>"
  "d9d592028a39d44769bfd310193595a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Control-request)))
  "Returns md5sum for a message object of type 'Control-request"
  "d9d592028a39d44769bfd310193595a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Control-request>)))
  "Returns full string definition for message of type '<Control-request>"
  (cl:format cl:nil "string[] controlInfo~%float32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Control-request)))
  "Returns full string definition for message of type 'Control-request"
  (cl:format cl:nil "string[] controlInfo~%float32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Control-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'controlInfo) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Control-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Control-request
    (cl:cons ':controlInfo (controlInfo msg))
    (cl:cons ':value (value msg))
))
;//! \htmlinclude Control-response.msg.html

(cl:defclass <Control-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Control-response (<Control-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Control-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Control-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<Control-response> is deprecated: use robot_audio-srv:Control-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <Control-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:result-val is deprecated.  Use robot_audio-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Control-response>) ostream)
  "Serializes a message object of type '<Control-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Control-response>) istream)
  "Deserializes a message object of type '<Control-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Control-response>)))
  "Returns string type for a service object of type '<Control-response>"
  "robot_audio/ControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Control-response)))
  "Returns string type for a service object of type 'Control-response"
  "robot_audio/ControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Control-response>)))
  "Returns md5sum for a message object of type '<Control-response>"
  "d9d592028a39d44769bfd310193595a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Control-response)))
  "Returns md5sum for a message object of type 'Control-response"
  "d9d592028a39d44769bfd310193595a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Control-response>)))
  "Returns full string definition for message of type '<Control-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Control-response)))
  "Returns full string definition for message of type 'Control-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Control-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Control-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Control-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Control)))
  'Control-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Control)))
  'Control-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Control)))
  "Returns string type for a service object of type '<Control>"
  "robot_audio/Control")