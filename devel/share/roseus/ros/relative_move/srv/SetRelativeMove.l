;; Auto-generated. Do not edit!


(when (boundp 'relative_move::SetRelativeMove)
  (if (not (find-package "RELATIVE_MOVE"))
    (make-package "RELATIVE_MOVE"))
  (shadow 'SetRelativeMove (find-package "RELATIVE_MOVE")))
(unless (find-package "RELATIVE_MOVE::SETRELATIVEMOVE")
  (make-package "RELATIVE_MOVE::SETRELATIVEMOVE"))
(unless (find-package "RELATIVE_MOVE::SETRELATIVEMOVEREQUEST")
  (make-package "RELATIVE_MOVE::SETRELATIVEMOVEREQUEST"))
(unless (find-package "RELATIVE_MOVE::SETRELATIVEMOVERESPONSE")
  (make-package "RELATIVE_MOVE::SETRELATIVEMOVERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass relative_move::SetRelativeMoveRequest
  :super ros::object
  :slots (_goal _global_frame _avoid_obstacle _finishStopObstacle ))

(defmethod relative_move::SetRelativeMoveRequest
  (:init
   (&key
    ((:goal __goal) (instance geometry_msgs::Pose2D :init))
    ((:global_frame __global_frame) "")
    ((:avoid_obstacle __avoid_obstacle) nil)
    ((:finishStopObstacle __finishStopObstacle) nil)
    )
   (send-super :init)
   (setq _goal __goal)
   (setq _global_frame (string __global_frame))
   (setq _avoid_obstacle __avoid_obstacle)
   (setq _finishStopObstacle __finishStopObstacle)
   self)
  (:goal
   (&rest __goal)
   (if (keywordp (car __goal))
       (send* _goal __goal)
     (progn
       (if __goal (setq _goal (car __goal)))
       _goal)))
  (:global_frame
   (&optional __global_frame)
   (if __global_frame (setq _global_frame __global_frame)) _global_frame)
  (:avoid_obstacle
   (&optional __avoid_obstacle)
   (if __avoid_obstacle (setq _avoid_obstacle __avoid_obstacle)) _avoid_obstacle)
  (:finishStopObstacle
   (&optional __finishStopObstacle)
   (if __finishStopObstacle (setq _finishStopObstacle __finishStopObstacle)) _finishStopObstacle)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose2D _goal
    (send _goal :serialization-length)
    ;; string _global_frame
    4 (length _global_frame)
    ;; bool _avoid_obstacle
    1
    ;; bool _finishStopObstacle
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose2D _goal
       (send _goal :serialize s)
     ;; string _global_frame
       (write-long (length _global_frame) s) (princ _global_frame s)
     ;; bool _avoid_obstacle
       (if _avoid_obstacle (write-byte -1 s) (write-byte 0 s))
     ;; bool _finishStopObstacle
       (if _finishStopObstacle (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose2D _goal
     (send _goal :deserialize buf ptr-) (incf ptr- (send _goal :serialization-length))
   ;; string _global_frame
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _global_frame (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _avoid_obstacle
     (setq _avoid_obstacle (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _finishStopObstacle
     (setq _finishStopObstacle (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass relative_move::SetRelativeMoveResponse
  :super ros::object
  :slots (_success _message ))

(defmethod relative_move::SetRelativeMoveResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass relative_move::SetRelativeMove
  :super ros::object
  :slots ())

(setf (get relative_move::SetRelativeMove :md5sum-) "2f55ab509885410fe15bd79d5cf0ed25")
(setf (get relative_move::SetRelativeMove :datatype-) "relative_move/SetRelativeMove")
(setf (get relative_move::SetRelativeMove :request) relative_move::SetRelativeMoveRequest)
(setf (get relative_move::SetRelativeMove :response) relative_move::SetRelativeMoveResponse)

(defmethod relative_move::SetRelativeMoveRequest
  (:response () (instance relative_move::SetRelativeMoveResponse :init)))

(setf (get relative_move::SetRelativeMoveRequest :md5sum-) "2f55ab509885410fe15bd79d5cf0ed25")
(setf (get relative_move::SetRelativeMoveRequest :datatype-) "relative_move/SetRelativeMoveRequest")
(setf (get relative_move::SetRelativeMoveRequest :definition-)
      "geometry_msgs/Pose2D goal
string global_frame #map odom
bool avoid_obstacle
bool finishStopObstacle #停障碍时是否直接结束

================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
---
bool success
string message

")

(setf (get relative_move::SetRelativeMoveResponse :md5sum-) "2f55ab509885410fe15bd79d5cf0ed25")
(setf (get relative_move::SetRelativeMoveResponse :datatype-) "relative_move/SetRelativeMoveResponse")
(setf (get relative_move::SetRelativeMoveResponse :definition-)
      "geometry_msgs/Pose2D goal
string global_frame #map odom
bool avoid_obstacle
bool finishStopObstacle #停障碍时是否直接结束

================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
---
bool success
string message

")



(provide :relative_move/SetRelativeMove "2f55ab509885410fe15bd79d5cf0ed25")


