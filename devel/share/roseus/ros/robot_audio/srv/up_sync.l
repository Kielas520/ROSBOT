;; Auto-generated. Do not edit!


(when (boundp 'robot_audio::up_sync)
  (if (not (find-package "ROBOT_AUDIO"))
    (make-package "ROBOT_AUDIO"))
  (shadow 'up_sync (find-package "ROBOT_AUDIO")))
(unless (find-package "ROBOT_AUDIO::UP_SYNC")
  (make-package "ROBOT_AUDIO::UP_SYNC"))
(unless (find-package "ROBOT_AUDIO::UP_SYNCREQUEST")
  (make-package "ROBOT_AUDIO::UP_SYNCREQUEST"))
(unless (find-package "ROBOT_AUDIO::UP_SYNCRESPONSE")
  (make-package "ROBOT_AUDIO::UP_SYNCRESPONSE"))

(in-package "ROS")





(defclass robot_audio::up_syncRequest
  :super ros::object
  :slots ())

(defmethod robot_audio::up_syncRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass robot_audio::up_syncResponse
  :super ros::object
  :slots (_result ))

(defmethod robot_audio::up_syncResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_audio::up_sync
  :super ros::object
  :slots ())

(setf (get robot_audio::up_sync :md5sum-) "eb13ac1f1354ccecb7941ee8fa2192e8")
(setf (get robot_audio::up_sync :datatype-) "robot_audio/up_sync")
(setf (get robot_audio::up_sync :request) robot_audio::up_syncRequest)
(setf (get robot_audio::up_sync :response) robot_audio::up_syncResponse)

(defmethod robot_audio::up_syncRequest
  (:response () (instance robot_audio::up_syncResponse :init)))

(setf (get robot_audio::up_syncRequest :md5sum-) "eb13ac1f1354ccecb7941ee8fa2192e8")
(setf (get robot_audio::up_syncRequest :datatype-) "robot_audio/up_syncRequest")
(setf (get robot_audio::up_syncRequest :definition-)
      "---
bool result

")

(setf (get robot_audio::up_syncResponse :md5sum-) "eb13ac1f1354ccecb7941ee8fa2192e8")
(setf (get robot_audio::up_syncResponse :datatype-) "robot_audio/up_syncResponse")
(setf (get robot_audio::up_syncResponse :definition-)
      "---
bool result

")



(provide :robot_audio/up_sync "eb13ac1f1354ccecb7941ee8fa2192e8")


