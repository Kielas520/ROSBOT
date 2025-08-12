;; Auto-generated. Do not edit!


(when (boundp 'robot_audio::Nav)
  (if (not (find-package "ROBOT_AUDIO"))
    (make-package "ROBOT_AUDIO"))
  (shadow 'Nav (find-package "ROBOT_AUDIO")))
(unless (find-package "ROBOT_AUDIO::NAV")
  (make-package "ROBOT_AUDIO::NAV"))
(unless (find-package "ROBOT_AUDIO::NAVREQUEST")
  (make-package "ROBOT_AUDIO::NAVREQUEST"))
(unless (find-package "ROBOT_AUDIO::NAVRESPONSE")
  (make-package "ROBOT_AUDIO::NAVRESPONSE"))

(in-package "ROS")





(defclass robot_audio::NavRequest
  :super ros::object
  :slots (_nav_order ))

(defmethod robot_audio::NavRequest
  (:init
   (&key
    ((:nav_order __nav_order) "")
    )
   (send-super :init)
   (setq _nav_order (string __nav_order))
   self)
  (:nav_order
   (&optional __nav_order)
   (if __nav_order (setq _nav_order __nav_order)) _nav_order)
  (:serialization-length
   ()
   (+
    ;; string _nav_order
    4 (length _nav_order)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _nav_order
       (write-long (length _nav_order) s) (princ _nav_order s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _nav_order
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _nav_order (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_audio::NavResponse
  :super ros::object
  :slots (_position ))

(defmethod robot_audio::NavResponse
  (:init
   (&key
    ((:position __position) "")
    )
   (send-super :init)
   (setq _position (string __position))
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; string _position
    4 (length _position)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _position
       (write-long (length _position) s) (princ _position s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _position
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _position (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_audio::Nav
  :super ros::object
  :slots ())

(setf (get robot_audio::Nav :md5sum-) "a5777d99dbd597cc68511d66738b3956")
(setf (get robot_audio::Nav :datatype-) "robot_audio/Nav")
(setf (get robot_audio::Nav :request) robot_audio::NavRequest)
(setf (get robot_audio::Nav :response) robot_audio::NavResponse)

(defmethod robot_audio::NavRequest
  (:response () (instance robot_audio::NavResponse :init)))

(setf (get robot_audio::NavRequest :md5sum-) "a5777d99dbd597cc68511d66738b3956")
(setf (get robot_audio::NavRequest :datatype-) "robot_audio/NavRequest")
(setf (get robot_audio::NavRequest :definition-)
      "string nav_order
---
string position

")

(setf (get robot_audio::NavResponse :md5sum-) "a5777d99dbd597cc68511d66738b3956")
(setf (get robot_audio::NavResponse :datatype-) "robot_audio/NavResponse")
(setf (get robot_audio::NavResponse :definition-)
      "string nav_order
---
string position

")



(provide :robot_audio/Nav "a5777d99dbd597cc68511d66738b3956")


