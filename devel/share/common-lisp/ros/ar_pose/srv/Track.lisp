; Auto-generated. Do not edit!


(cl:in-package ar_pose-srv)


;//! \htmlinclude Track-request.msg.html

(cl:defclass <Track-request> (roslisp-msg-protocol:ros-message)
  ((ar_id
    :reader ar_id
    :initarg :ar_id
    :type cl:fixnum
    :initform 0)
   (goal_dist
    :reader goal_dist
    :initarg :goal_dist
    :type cl:float
    :initform 0.0))
)

(cl:defclass Track-request (<Track-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Track-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Track-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ar_pose-srv:<Track-request> is deprecated: use ar_pose-srv:Track-request instead.")))

(cl:ensure-generic-function 'ar_id-val :lambda-list '(m))
(cl:defmethod ar_id-val ((m <Track-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ar_pose-srv:ar_id-val is deprecated.  Use ar_pose-srv:ar_id instead.")
  (ar_id m))

(cl:ensure-generic-function 'goal_dist-val :lambda-list '(m))
(cl:defmethod goal_dist-val ((m <Track-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ar_pose-srv:goal_dist-val is deprecated.  Use ar_pose-srv:goal_dist instead.")
  (goal_dist m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Track-request>) ostream)
  "Serializes a message object of type '<Track-request>"
  (cl:let* ((signed (cl:slot-value msg 'ar_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'goal_dist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Track-request>) istream)
  "Deserializes a message object of type '<Track-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ar_id) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'goal_dist) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Track-request>)))
  "Returns string type for a service object of type '<Track-request>"
  "ar_pose/TrackRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Track-request)))
  "Returns string type for a service object of type 'Track-request"
  "ar_pose/TrackRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Track-request>)))
  "Returns md5sum for a message object of type '<Track-request>"
  "a9830d64a630dd3c64bf976a0539314c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Track-request)))
  "Returns md5sum for a message object of type 'Track-request"
  "a9830d64a630dd3c64bf976a0539314c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Track-request>)))
  "Returns full string definition for message of type '<Track-request>"
  (cl:format cl:nil "int8 ar_id~%float32 goal_dist~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Track-request)))
  "Returns full string definition for message of type 'Track-request"
  (cl:format cl:nil "int8 ar_id~%float32 goal_dist~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Track-request>))
  (cl:+ 0
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Track-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Track-request
    (cl:cons ':ar_id (ar_id msg))
    (cl:cons ':goal_dist (goal_dist msg))
))
;//! \htmlinclude Track-response.msg.html

(cl:defclass <Track-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform "")
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Track-response (<Track-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Track-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Track-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ar_pose-srv:<Track-response> is deprecated: use ar_pose-srv:Track-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <Track-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ar_pose-srv:message-val is deprecated.  Use ar_pose-srv:message instead.")
  (message m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Track-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ar_pose-srv:success-val is deprecated.  Use ar_pose-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Track-response>) ostream)
  "Serializes a message object of type '<Track-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Track-response>) istream)
  "Deserializes a message object of type '<Track-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Track-response>)))
  "Returns string type for a service object of type '<Track-response>"
  "ar_pose/TrackResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Track-response)))
  "Returns string type for a service object of type 'Track-response"
  "ar_pose/TrackResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Track-response>)))
  "Returns md5sum for a message object of type '<Track-response>"
  "a9830d64a630dd3c64bf976a0539314c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Track-response)))
  "Returns md5sum for a message object of type 'Track-response"
  "a9830d64a630dd3c64bf976a0539314c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Track-response>)))
  "Returns full string definition for message of type '<Track-response>"
  (cl:format cl:nil "string message~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Track-response)))
  "Returns full string definition for message of type 'Track-response"
  (cl:format cl:nil "string message~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Track-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Track-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Track-response
    (cl:cons ':message (message msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Track)))
  'Track-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Track)))
  'Track-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Track)))
  "Returns string type for a service object of type '<Track>"
  "ar_pose/Track")