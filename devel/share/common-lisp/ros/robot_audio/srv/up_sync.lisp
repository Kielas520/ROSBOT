; Auto-generated. Do not edit!


(cl:in-package robot_audio-srv)


;//! \htmlinclude up_sync-request.msg.html

(cl:defclass <up_sync-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass up_sync-request (<up_sync-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <up_sync-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'up_sync-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<up_sync-request> is deprecated: use robot_audio-srv:up_sync-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <up_sync-request>) ostream)
  "Serializes a message object of type '<up_sync-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <up_sync-request>) istream)
  "Deserializes a message object of type '<up_sync-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<up_sync-request>)))
  "Returns string type for a service object of type '<up_sync-request>"
  "robot_audio/up_syncRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'up_sync-request)))
  "Returns string type for a service object of type 'up_sync-request"
  "robot_audio/up_syncRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<up_sync-request>)))
  "Returns md5sum for a message object of type '<up_sync-request>"
  "eb13ac1f1354ccecb7941ee8fa2192e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'up_sync-request)))
  "Returns md5sum for a message object of type 'up_sync-request"
  "eb13ac1f1354ccecb7941ee8fa2192e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<up_sync-request>)))
  "Returns full string definition for message of type '<up_sync-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'up_sync-request)))
  "Returns full string definition for message of type 'up_sync-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <up_sync-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <up_sync-request>))
  "Converts a ROS message object to a list"
  (cl:list 'up_sync-request
))
;//! \htmlinclude up_sync-response.msg.html

(cl:defclass <up_sync-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass up_sync-response (<up_sync-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <up_sync-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'up_sync-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<up_sync-response> is deprecated: use robot_audio-srv:up_sync-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <up_sync-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:result-val is deprecated.  Use robot_audio-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <up_sync-response>) ostream)
  "Serializes a message object of type '<up_sync-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <up_sync-response>) istream)
  "Deserializes a message object of type '<up_sync-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<up_sync-response>)))
  "Returns string type for a service object of type '<up_sync-response>"
  "robot_audio/up_syncResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'up_sync-response)))
  "Returns string type for a service object of type 'up_sync-response"
  "robot_audio/up_syncResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<up_sync-response>)))
  "Returns md5sum for a message object of type '<up_sync-response>"
  "eb13ac1f1354ccecb7941ee8fa2192e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'up_sync-response)))
  "Returns md5sum for a message object of type 'up_sync-response"
  "eb13ac1f1354ccecb7941ee8fa2192e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<up_sync-response>)))
  "Returns full string definition for message of type '<up_sync-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'up_sync-response)))
  "Returns full string definition for message of type 'up_sync-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <up_sync-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <up_sync-response>))
  "Converts a ROS message object to a list"
  (cl:list 'up_sync-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'up_sync)))
  'up_sync-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'up_sync)))
  'up_sync-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'up_sync)))
  "Returns string type for a service object of type '<up_sync>"
  "robot_audio/up_sync")