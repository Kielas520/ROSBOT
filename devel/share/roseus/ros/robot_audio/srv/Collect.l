;; Auto-generated. Do not edit!


(when (boundp 'robot_audio::Collect)
  (if (not (find-package "ROBOT_AUDIO"))
    (make-package "ROBOT_AUDIO"))
  (shadow 'Collect (find-package "ROBOT_AUDIO")))
(unless (find-package "ROBOT_AUDIO::COLLECT")
  (make-package "ROBOT_AUDIO::COLLECT"))
(unless (find-package "ROBOT_AUDIO::COLLECTREQUEST")
  (make-package "ROBOT_AUDIO::COLLECTREQUEST"))
(unless (find-package "ROBOT_AUDIO::COLLECTRESPONSE")
  (make-package "ROBOT_AUDIO::COLLECTRESPONSE"))

(in-package "ROS")





(defclass robot_audio::CollectRequest
  :super ros::object
  :slots (_collect_flag ))

(defmethod robot_audio::CollectRequest
  (:init
   (&key
    ((:collect_flag __collect_flag) nil)
    )
   (send-super :init)
   (setq _collect_flag __collect_flag)
   self)
  (:collect_flag
   (&optional (__collect_flag :null))
   (if (not (eq __collect_flag :null)) (setq _collect_flag __collect_flag)) _collect_flag)
  (:serialization-length
   ()
   (+
    ;; bool _collect_flag
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _collect_flag
       (if _collect_flag (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _collect_flag
     (setq _collect_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_audio::CollectResponse
  :super ros::object
  :slots (_voice_filename ))

(defmethod robot_audio::CollectResponse
  (:init
   (&key
    ((:voice_filename __voice_filename) "")
    )
   (send-super :init)
   (setq _voice_filename (string __voice_filename))
   self)
  (:voice_filename
   (&optional __voice_filename)
   (if __voice_filename (setq _voice_filename __voice_filename)) _voice_filename)
  (:serialization-length
   ()
   (+
    ;; string _voice_filename
    4 (length _voice_filename)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _voice_filename
       (write-long (length _voice_filename) s) (princ _voice_filename s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _voice_filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _voice_filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_audio::Collect
  :super ros::object
  :slots ())

(setf (get robot_audio::Collect :md5sum-) "10ccb23b7c8752a359f2fdb188e7b775")
(setf (get robot_audio::Collect :datatype-) "robot_audio/Collect")
(setf (get robot_audio::Collect :request) robot_audio::CollectRequest)
(setf (get robot_audio::Collect :response) robot_audio::CollectResponse)

(defmethod robot_audio::CollectRequest
  (:response () (instance robot_audio::CollectResponse :init)))

(setf (get robot_audio::CollectRequest :md5sum-) "10ccb23b7c8752a359f2fdb188e7b775")
(setf (get robot_audio::CollectRequest :datatype-) "robot_audio/CollectRequest")
(setf (get robot_audio::CollectRequest :definition-)
      "bool collect_flag
---
string voice_filename

")

(setf (get robot_audio::CollectResponse :md5sum-) "10ccb23b7c8752a359f2fdb188e7b775")
(setf (get robot_audio::CollectResponse :datatype-) "robot_audio/CollectResponse")
(setf (get robot_audio::CollectResponse :definition-)
      "bool collect_flag
---
string voice_filename

")



(provide :robot_audio/Collect "10ccb23b7c8752a359f2fdb188e7b775")


