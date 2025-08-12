; Auto-generated. Do not edit!


(cl:in-package face_rec-srv)


;//! \htmlinclude recognition_results-request.msg.html

(cl:defclass <recognition_results-request> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (image_path
    :reader image_path
    :initarg :image_path
    :type cl:string
    :initform ""))
)

(cl:defclass recognition_results-request (<recognition_results-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <recognition_results-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'recognition_results-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name face_rec-srv:<recognition_results-request> is deprecated: use face_rec-srv:recognition_results-request instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <recognition_results-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_rec-srv:mode-val is deprecated.  Use face_rec-srv:mode instead.")
  (mode m))

(cl:ensure-generic-function 'image_path-val :lambda-list '(m))
(cl:defmethod image_path-val ((m <recognition_results-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_rec-srv:image_path-val is deprecated.  Use face_rec-srv:image_path instead.")
  (image_path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <recognition_results-request>) ostream)
  "Serializes a message object of type '<recognition_results-request>"
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'image_path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'image_path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <recognition_results-request>) istream)
  "Deserializes a message object of type '<recognition_results-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'image_path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'image_path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<recognition_results-request>)))
  "Returns string type for a service object of type '<recognition_results-request>"
  "face_rec/recognition_resultsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recognition_results-request)))
  "Returns string type for a service object of type 'recognition_results-request"
  "face_rec/recognition_resultsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<recognition_results-request>)))
  "Returns md5sum for a message object of type '<recognition_results-request>"
  "63688d89abce970a45bd24bcb017d875")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'recognition_results-request)))
  "Returns md5sum for a message object of type 'recognition_results-request"
  "63688d89abce970a45bd24bcb017d875")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<recognition_results-request>)))
  "Returns full string definition for message of type '<recognition_results-request>"
  (cl:format cl:nil "int8 mode~%string image_path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'recognition_results-request)))
  "Returns full string definition for message of type 'recognition_results-request"
  (cl:format cl:nil "int8 mode~%string image_path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <recognition_results-request>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'image_path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <recognition_results-request>))
  "Converts a ROS message object to a list"
  (cl:list 'recognition_results-request
    (cl:cons ':mode (mode msg))
    (cl:cons ':image_path (image_path msg))
))
;//! \htmlinclude recognition_results-response.msg.html

(cl:defclass <recognition_results-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type face_rec-msg:face_results
    :initform (cl:make-instance 'face_rec-msg:face_results))
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass recognition_results-response (<recognition_results-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <recognition_results-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'recognition_results-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name face_rec-srv:<recognition_results-response> is deprecated: use face_rec-srv:recognition_results-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <recognition_results-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_rec-srv:result-val is deprecated.  Use face_rec-srv:result instead.")
  (result m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <recognition_results-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_rec-srv:success-val is deprecated.  Use face_rec-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <recognition_results-response>) ostream)
  "Serializes a message object of type '<recognition_results-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'result) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <recognition_results-response>) istream)
  "Deserializes a message object of type '<recognition_results-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'result) istream)
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<recognition_results-response>)))
  "Returns string type for a service object of type '<recognition_results-response>"
  "face_rec/recognition_resultsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recognition_results-response)))
  "Returns string type for a service object of type 'recognition_results-response"
  "face_rec/recognition_resultsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<recognition_results-response>)))
  "Returns md5sum for a message object of type '<recognition_results-response>"
  "63688d89abce970a45bd24bcb017d875")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'recognition_results-response)))
  "Returns md5sum for a message object of type 'recognition_results-response"
  "63688d89abce970a45bd24bcb017d875")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<recognition_results-response>)))
  "Returns full string definition for message of type '<recognition_results-response>"
  (cl:format cl:nil "face_rec/face_results result~%bool success~%~%================================================================================~%MSG: face_rec/face_results~%uint8 num~%face_rec/face_data[] face_data~%================================================================================~%MSG: face_rec/face_data~%string name~%float64 xmin~%float64 xmax~%float64 ymin~%float64 ymax~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'recognition_results-response)))
  "Returns full string definition for message of type 'recognition_results-response"
  (cl:format cl:nil "face_rec/face_results result~%bool success~%~%================================================================================~%MSG: face_rec/face_results~%uint8 num~%face_rec/face_data[] face_data~%================================================================================~%MSG: face_rec/face_data~%string name~%float64 xmin~%float64 xmax~%float64 ymin~%float64 ymax~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <recognition_results-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'result))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <recognition_results-response>))
  "Converts a ROS message object to a list"
  (cl:list 'recognition_results-response
    (cl:cons ':result (result msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'recognition_results)))
  'recognition_results-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'recognition_results)))
  'recognition_results-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recognition_results)))
  "Returns string type for a service object of type '<recognition_results>"
  "face_rec/recognition_results")