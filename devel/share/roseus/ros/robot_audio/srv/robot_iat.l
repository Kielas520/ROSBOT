;; Auto-generated. Do not edit!


(when (boundp 'robot_audio::robot_iat)
  (if (not (find-package "ROBOT_AUDIO"))
    (make-package "ROBOT_AUDIO"))
  (shadow 'robot_iat (find-package "ROBOT_AUDIO")))
(unless (find-package "ROBOT_AUDIO::ROBOT_IAT")
  (make-package "ROBOT_AUDIO::ROBOT_IAT"))
(unless (find-package "ROBOT_AUDIO::ROBOT_IATREQUEST")
  (make-package "ROBOT_AUDIO::ROBOT_IATREQUEST"))
(unless (find-package "ROBOT_AUDIO::ROBOT_IATRESPONSE")
  (make-package "ROBOT_AUDIO::ROBOT_IATRESPONSE"))

(in-package "ROS")





(defclass robot_audio::robot_iatRequest
  :super ros::object
  :slots (_audiopath ))

(defmethod robot_audio::robot_iatRequest
  (:init
   (&key
    ((:audiopath __audiopath) "")
    )
   (send-super :init)
   (setq _audiopath (string __audiopath))
   self)
  (:audiopath
   (&optional __audiopath)
   (if __audiopath (setq _audiopath __audiopath)) _audiopath)
  (:serialization-length
   ()
   (+
    ;; string _audiopath
    4 (length _audiopath)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _audiopath
       (write-long (length _audiopath) s) (princ _audiopath s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _audiopath
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _audiopath (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_audio::robot_iatResponse
  :super ros::object
  :slots (_text ))

(defmethod robot_audio::robot_iatResponse
  (:init
   (&key
    ((:text __text) "")
    )
   (send-super :init)
   (setq _text (string __text))
   self)
  (:text
   (&optional __text)
   (if __text (setq _text __text)) _text)
  (:serialization-length
   ()
   (+
    ;; string _text
    4 (length _text)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _text
       (write-long (length _text) s) (princ _text s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_audio::robot_iat
  :super ros::object
  :slots ())

(setf (get robot_audio::robot_iat :md5sum-) "318b42904b3fd33a38a273170db5f135")
(setf (get robot_audio::robot_iat :datatype-) "robot_audio/robot_iat")
(setf (get robot_audio::robot_iat :request) robot_audio::robot_iatRequest)
(setf (get robot_audio::robot_iat :response) robot_audio::robot_iatResponse)

(defmethod robot_audio::robot_iatRequest
  (:response () (instance robot_audio::robot_iatResponse :init)))

(setf (get robot_audio::robot_iatRequest :md5sum-) "318b42904b3fd33a38a273170db5f135")
(setf (get robot_audio::robot_iatRequest :datatype-) "robot_audio/robot_iatRequest")
(setf (get robot_audio::robot_iatRequest :definition-)
      "string audiopath
---
string text

")

(setf (get robot_audio::robot_iatResponse :md5sum-) "318b42904b3fd33a38a273170db5f135")
(setf (get robot_audio::robot_iatResponse :datatype-) "robot_audio/robot_iatResponse")
(setf (get robot_audio::robot_iatResponse :definition-)
      "string audiopath
---
string text

")



(provide :robot_audio/robot_iat "318b42904b3fd33a38a273170db5f135")


