; Auto-generated. Do not edit!


(cl:in-package robot_audio-srv)


;//! \htmlinclude robot_semanteme-request.msg.html

(cl:defclass <robot_semanteme-request> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:integer
    :initform 0)
   (textorpath
    :reader textorpath
    :initarg :textorpath
    :type cl:string
    :initform ""))
)

(cl:defclass robot_semanteme-request (<robot_semanteme-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_semanteme-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_semanteme-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<robot_semanteme-request> is deprecated: use robot_audio-srv:robot_semanteme-request instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <robot_semanteme-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:mode-val is deprecated.  Use robot_audio-srv:mode instead.")
  (mode m))

(cl:ensure-generic-function 'textorpath-val :lambda-list '(m))
(cl:defmethod textorpath-val ((m <robot_semanteme-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:textorpath-val is deprecated.  Use robot_audio-srv:textorpath instead.")
  (textorpath m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_semanteme-request>) ostream)
  "Serializes a message object of type '<robot_semanteme-request>"
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'textorpath))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'textorpath))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_semanteme-request>) istream)
  "Deserializes a message object of type '<robot_semanteme-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'textorpath) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'textorpath) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_semanteme-request>)))
  "Returns string type for a service object of type '<robot_semanteme-request>"
  "robot_audio/robot_semantemeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_semanteme-request)))
  "Returns string type for a service object of type 'robot_semanteme-request"
  "robot_audio/robot_semantemeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_semanteme-request>)))
  "Returns md5sum for a message object of type '<robot_semanteme-request>"
  "137f770ca875cecbf1fccdae0ac71f77")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_semanteme-request)))
  "Returns md5sum for a message object of type 'robot_semanteme-request"
  "137f770ca875cecbf1fccdae0ac71f77")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_semanteme-request>)))
  "Returns full string definition for message of type '<robot_semanteme-request>"
  (cl:format cl:nil "int32 mode~%string textorpath~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_semanteme-request)))
  "Returns full string definition for message of type 'robot_semanteme-request"
  (cl:format cl:nil "int32 mode~%string textorpath~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_semanteme-request>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'textorpath))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_semanteme-request>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_semanteme-request
    (cl:cons ':mode (mode msg))
    (cl:cons ':textorpath (textorpath msg))
))
;//! \htmlinclude robot_semanteme-response.msg.html

(cl:defclass <robot_semanteme-response> (roslisp-msg-protocol:ros-message)
  ((tech
    :reader tech
    :initarg :tech
    :type cl:string
    :initform "")
   (iat
    :reader iat
    :initarg :iat
    :type cl:string
    :initform "")
   (anwser
    :reader anwser
    :initarg :anwser
    :type cl:string
    :initform "")
   (intent
    :reader intent
    :initarg :intent
    :type cl:string
    :initform "")
   (slots_name
    :reader slots_name
    :initarg :slots_name
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (slots_value
    :reader slots_value
    :initarg :slots_value
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass robot_semanteme-response (<robot_semanteme-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_semanteme-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_semanteme-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_audio-srv:<robot_semanteme-response> is deprecated: use robot_audio-srv:robot_semanteme-response instead.")))

(cl:ensure-generic-function 'tech-val :lambda-list '(m))
(cl:defmethod tech-val ((m <robot_semanteme-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:tech-val is deprecated.  Use robot_audio-srv:tech instead.")
  (tech m))

(cl:ensure-generic-function 'iat-val :lambda-list '(m))
(cl:defmethod iat-val ((m <robot_semanteme-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:iat-val is deprecated.  Use robot_audio-srv:iat instead.")
  (iat m))

(cl:ensure-generic-function 'anwser-val :lambda-list '(m))
(cl:defmethod anwser-val ((m <robot_semanteme-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:anwser-val is deprecated.  Use robot_audio-srv:anwser instead.")
  (anwser m))

(cl:ensure-generic-function 'intent-val :lambda-list '(m))
(cl:defmethod intent-val ((m <robot_semanteme-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:intent-val is deprecated.  Use robot_audio-srv:intent instead.")
  (intent m))

(cl:ensure-generic-function 'slots_name-val :lambda-list '(m))
(cl:defmethod slots_name-val ((m <robot_semanteme-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:slots_name-val is deprecated.  Use robot_audio-srv:slots_name instead.")
  (slots_name m))

(cl:ensure-generic-function 'slots_value-val :lambda-list '(m))
(cl:defmethod slots_value-val ((m <robot_semanteme-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_audio-srv:slots_value-val is deprecated.  Use robot_audio-srv:slots_value instead.")
  (slots_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_semanteme-response>) ostream)
  "Serializes a message object of type '<robot_semanteme-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'tech))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'tech))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'iat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'iat))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'anwser))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'anwser))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'intent))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'intent))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'slots_name))))
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
   (cl:slot-value msg 'slots_name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'slots_value))))
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
   (cl:slot-value msg 'slots_value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_semanteme-response>) istream)
  "Deserializes a message object of type '<robot_semanteme-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tech) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'tech) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'iat) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'iat) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'anwser) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'anwser) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'intent) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'intent) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'slots_name) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'slots_name)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'slots_value) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'slots_value)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_semanteme-response>)))
  "Returns string type for a service object of type '<robot_semanteme-response>"
  "robot_audio/robot_semantemeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_semanteme-response)))
  "Returns string type for a service object of type 'robot_semanteme-response"
  "robot_audio/robot_semantemeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_semanteme-response>)))
  "Returns md5sum for a message object of type '<robot_semanteme-response>"
  "137f770ca875cecbf1fccdae0ac71f77")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_semanteme-response)))
  "Returns md5sum for a message object of type 'robot_semanteme-response"
  "137f770ca875cecbf1fccdae0ac71f77")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_semanteme-response>)))
  "Returns full string definition for message of type '<robot_semanteme-response>"
  (cl:format cl:nil "string tech~%string iat~%string anwser~%string intent~%string[] slots_name~%string[] slots_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_semanteme-response)))
  "Returns full string definition for message of type 'robot_semanteme-response"
  (cl:format cl:nil "string tech~%string iat~%string anwser~%string intent~%string[] slots_name~%string[] slots_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_semanteme-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'tech))
     4 (cl:length (cl:slot-value msg 'iat))
     4 (cl:length (cl:slot-value msg 'anwser))
     4 (cl:length (cl:slot-value msg 'intent))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'slots_name) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'slots_value) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_semanteme-response>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_semanteme-response
    (cl:cons ':tech (tech msg))
    (cl:cons ':iat (iat msg))
    (cl:cons ':anwser (anwser msg))
    (cl:cons ':intent (intent msg))
    (cl:cons ':slots_name (slots_name msg))
    (cl:cons ':slots_value (slots_value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'robot_semanteme)))
  'robot_semanteme-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'robot_semanteme)))
  'robot_semanteme-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_semanteme)))
  "Returns string type for a service object of type '<robot_semanteme>"
  "robot_audio/robot_semanteme")