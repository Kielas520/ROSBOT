; Auto-generated. Do not edit!


(cl:in-package face_rec-msg)


;//! \htmlinclude face_results.msg.html

(cl:defclass <face_results> (roslisp-msg-protocol:ros-message)
  ((num
    :reader num
    :initarg :num
    :type cl:fixnum
    :initform 0)
   (face_data
    :reader face_data
    :initarg :face_data
    :type (cl:vector face_rec-msg:face_data)
   :initform (cl:make-array 0 :element-type 'face_rec-msg:face_data :initial-element (cl:make-instance 'face_rec-msg:face_data))))
)

(cl:defclass face_results (<face_results>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <face_results>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'face_results)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name face_rec-msg:<face_results> is deprecated: use face_rec-msg:face_results instead.")))

(cl:ensure-generic-function 'num-val :lambda-list '(m))
(cl:defmethod num-val ((m <face_results>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_rec-msg:num-val is deprecated.  Use face_rec-msg:num instead.")
  (num m))

(cl:ensure-generic-function 'face_data-val :lambda-list '(m))
(cl:defmethod face_data-val ((m <face_results>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_rec-msg:face_data-val is deprecated.  Use face_rec-msg:face_data instead.")
  (face_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <face_results>) ostream)
  "Serializes a message object of type '<face_results>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'face_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'face_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <face_results>) istream)
  "Deserializes a message object of type '<face_results>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'face_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'face_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'face_rec-msg:face_data))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<face_results>)))
  "Returns string type for a message object of type '<face_results>"
  "face_rec/face_results")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'face_results)))
  "Returns string type for a message object of type 'face_results"
  "face_rec/face_results")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<face_results>)))
  "Returns md5sum for a message object of type '<face_results>"
  "3582c39ba7ba2498c9e7ea9f75703724")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'face_results)))
  "Returns md5sum for a message object of type 'face_results"
  "3582c39ba7ba2498c9e7ea9f75703724")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<face_results>)))
  "Returns full string definition for message of type '<face_results>"
  (cl:format cl:nil "uint8 num~%face_rec/face_data[] face_data~%================================================================================~%MSG: face_rec/face_data~%string name~%float64 xmin~%float64 xmax~%float64 ymin~%float64 ymax~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'face_results)))
  "Returns full string definition for message of type 'face_results"
  (cl:format cl:nil "uint8 num~%face_rec/face_data[] face_data~%================================================================================~%MSG: face_rec/face_data~%string name~%float64 xmin~%float64 xmax~%float64 ymin~%float64 ymax~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <face_results>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'face_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <face_results>))
  "Converts a ROS message object to a list"
  (cl:list 'face_results
    (cl:cons ':num (num msg))
    (cl:cons ':face_data (face_data msg))
))
