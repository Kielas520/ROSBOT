;; Auto-generated. Do not edit!


(when (boundp 'robot_audio::robot_tts)
  (if (not (find-package "ROBOT_AUDIO"))
    (make-package "ROBOT_AUDIO"))
  (shadow 'robot_tts (find-package "ROBOT_AUDIO")))
(unless (find-package "ROBOT_AUDIO::ROBOT_TTS")
  (make-package "ROBOT_AUDIO::ROBOT_TTS"))
(unless (find-package "ROBOT_AUDIO::ROBOT_TTSREQUEST")
  (make-package "ROBOT_AUDIO::ROBOT_TTSREQUEST"))
(unless (find-package "ROBOT_AUDIO::ROBOT_TTSRESPONSE")
  (make-package "ROBOT_AUDIO::ROBOT_TTSRESPONSE"))

(in-package "ROS")





(defclass robot_audio::robot_ttsRequest
  :super ros::object
  :slots (_text _play ))

(defmethod robot_audio::robot_ttsRequest
  (:init
   (&key
    ((:text __text) "")
    ((:play __play) nil)
    )
   (send-super :init)
   (setq _text (string __text))
   (setq _play __play)
   self)
  (:text
   (&optional __text)
   (if __text (setq _text __text)) _text)
  (:play
   (&optional (__play :null))
   (if (not (eq __play :null)) (setq _play __play)) _play)
  (:serialization-length
   ()
   (+
    ;; string _text
    4 (length _text)
    ;; bool _play
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _text
       (write-long (length _text) s) (princ _text s)
     ;; bool _play
       (if _play (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _play
     (setq _play (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_audio::robot_ttsResponse
  :super ros::object
  :slots (_audiopath ))

(defmethod robot_audio::robot_ttsResponse
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

(defclass robot_audio::robot_tts
  :super ros::object
  :slots ())

(setf (get robot_audio::robot_tts :md5sum-) "2ad2a7e28f20ec853b183153ee6b6d2d")
(setf (get robot_audio::robot_tts :datatype-) "robot_audio/robot_tts")
(setf (get robot_audio::robot_tts :request) robot_audio::robot_ttsRequest)
(setf (get robot_audio::robot_tts :response) robot_audio::robot_ttsResponse)

(defmethod robot_audio::robot_ttsRequest
  (:response () (instance robot_audio::robot_ttsResponse :init)))

(setf (get robot_audio::robot_ttsRequest :md5sum-) "2ad2a7e28f20ec853b183153ee6b6d2d")
(setf (get robot_audio::robot_ttsRequest :datatype-) "robot_audio/robot_ttsRequest")
(setf (get robot_audio::robot_ttsRequest :definition-)
      "string text
bool play
---
string audiopath

")

(setf (get robot_audio::robot_ttsResponse :md5sum-) "2ad2a7e28f20ec853b183153ee6b6d2d")
(setf (get robot_audio::robot_ttsResponse :datatype-) "robot_audio/robot_ttsResponse")
(setf (get robot_audio::robot_ttsResponse :definition-)
      "string text
bool play
---
string audiopath

")



(provide :robot_audio/robot_tts "2ad2a7e28f20ec853b183153ee6b6d2d")


