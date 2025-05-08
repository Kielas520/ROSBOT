;; Auto-generated. Do not edit!


(when (boundp 'ar_pose::ArPose)
  (if (not (find-package "AR_POSE"))
    (make-package "AR_POSE"))
  (shadow 'ArPose (find-package "AR_POSE")))
(unless (find-package "AR_POSE::ARPOSE")
  (make-package "AR_POSE::ARPOSE"))

(in-package "ROS")
;;//! \htmlinclude ArPose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass ar_pose::ArPose
  :super ros::object
  :slots (_number _position _roll _pitch _yaw _confidence ))

(defmethod ar_pose::ArPose
  (:init
   (&key
    ((:number __number) 0)
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:confidence __confidence) 0)
    )
   (send-super :init)
   (setq _number (round __number))
   (setq _position __position)
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _confidence (round __confidence))
   self)
  (:number
   (&optional __number)
   (if __number (setq _number __number)) _number)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:serialization-length
   ()
   (+
    ;; uint32 _number
    4
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ;; uint32 _confidence
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _number
       (write-long _number s)
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint32 _confidence
       (write-long _confidence s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _number
     (setq _number (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint32 _confidence
     (setq _confidence (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ar_pose::ArPose :md5sum-) "de174cac63b5f4f47785f23b578b7ac0")
(setf (get ar_pose::ArPose :datatype-) "ar_pose/ArPose")
(setf (get ar_pose::ArPose :definition-)
      "uint32 number
geometry_msgs/Point position
float64 roll
float64 pitch
float64 yaw
uint32 confidence
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :ar_pose/ArPose "de174cac63b5f4f47785f23b578b7ac0")


