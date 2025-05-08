;; Auto-generated. Do not edit!


(when (boundp 'ar_pose::Track)
  (if (not (find-package "AR_POSE"))
    (make-package "AR_POSE"))
  (shadow 'Track (find-package "AR_POSE")))
(unless (find-package "AR_POSE::TRACK")
  (make-package "AR_POSE::TRACK"))
(unless (find-package "AR_POSE::TRACKREQUEST")
  (make-package "AR_POSE::TRACKREQUEST"))
(unless (find-package "AR_POSE::TRACKRESPONSE")
  (make-package "AR_POSE::TRACKRESPONSE"))

(in-package "ROS")





(defclass ar_pose::TrackRequest
  :super ros::object
  :slots (_ar_id _goal_dist ))

(defmethod ar_pose::TrackRequest
  (:init
   (&key
    ((:ar_id __ar_id) 0)
    ((:goal_dist __goal_dist) 0.0)
    )
   (send-super :init)
   (setq _ar_id (round __ar_id))
   (setq _goal_dist (float __goal_dist))
   self)
  (:ar_id
   (&optional __ar_id)
   (if __ar_id (setq _ar_id __ar_id)) _ar_id)
  (:goal_dist
   (&optional __goal_dist)
   (if __goal_dist (setq _goal_dist __goal_dist)) _goal_dist)
  (:serialization-length
   ()
   (+
    ;; int8 _ar_id
    1
    ;; float32 _goal_dist
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _ar_id
       (write-byte _ar_id s)
     ;; float32 _goal_dist
       (sys::poke _goal_dist (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _ar_id
     (setq _ar_id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _ar_id 127) (setq _ar_id (- _ar_id 256)))
   ;; float32 _goal_dist
     (setq _goal_dist (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ar_pose::TrackResponse
  :super ros::object
  :slots (_message _success ))

(defmethod ar_pose::TrackResponse
  (:init
   (&key
    ((:message __message) "")
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _message (string __message))
   (setq _success __success)
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass ar_pose::Track
  :super ros::object
  :slots ())

(setf (get ar_pose::Track :md5sum-) "a9830d64a630dd3c64bf976a0539314c")
(setf (get ar_pose::Track :datatype-) "ar_pose/Track")
(setf (get ar_pose::Track :request) ar_pose::TrackRequest)
(setf (get ar_pose::Track :response) ar_pose::TrackResponse)

(defmethod ar_pose::TrackRequest
  (:response () (instance ar_pose::TrackResponse :init)))

(setf (get ar_pose::TrackRequest :md5sum-) "a9830d64a630dd3c64bf976a0539314c")
(setf (get ar_pose::TrackRequest :datatype-) "ar_pose/TrackRequest")
(setf (get ar_pose::TrackRequest :definition-)
      "int8 ar_id
float32 goal_dist
---
string message
bool success
")

(setf (get ar_pose::TrackResponse :md5sum-) "a9830d64a630dd3c64bf976a0539314c")
(setf (get ar_pose::TrackResponse :datatype-) "ar_pose/TrackResponse")
(setf (get ar_pose::TrackResponse :definition-)
      "int8 ar_id
float32 goal_dist
---
string message
bool success
")



(provide :ar_pose/Track "a9830d64a630dd3c64bf976a0539314c")


