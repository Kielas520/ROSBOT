;; Auto-generated. Do not edit!


(when (boundp 'robot_audio::robot_semanteme)
  (if (not (find-package "ROBOT_AUDIO"))
    (make-package "ROBOT_AUDIO"))
  (shadow 'robot_semanteme (find-package "ROBOT_AUDIO")))
(unless (find-package "ROBOT_AUDIO::ROBOT_SEMANTEME")
  (make-package "ROBOT_AUDIO::ROBOT_SEMANTEME"))
(unless (find-package "ROBOT_AUDIO::ROBOT_SEMANTEMEREQUEST")
  (make-package "ROBOT_AUDIO::ROBOT_SEMANTEMEREQUEST"))
(unless (find-package "ROBOT_AUDIO::ROBOT_SEMANTEMERESPONSE")
  (make-package "ROBOT_AUDIO::ROBOT_SEMANTEMERESPONSE"))

(in-package "ROS")





(defclass robot_audio::robot_semantemeRequest
  :super ros::object
  :slots (_mode _textorpath ))

(defmethod robot_audio::robot_semantemeRequest
  (:init
   (&key
    ((:mode __mode) 0)
    ((:textorpath __textorpath) "")
    )
   (send-super :init)
   (setq _mode (round __mode))
   (setq _textorpath (string __textorpath))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:textorpath
   (&optional __textorpath)
   (if __textorpath (setq _textorpath __textorpath)) _textorpath)
  (:serialization-length
   ()
   (+
    ;; int32 _mode
    4
    ;; string _textorpath
    4 (length _textorpath)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _mode
       (write-long _mode s)
     ;; string _textorpath
       (write-long (length _textorpath) s) (princ _textorpath s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _textorpath
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _textorpath (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_audio::robot_semantemeResponse
  :super ros::object
  :slots (_tech _iat _anwser _intent _slots_name _slots_value ))

(defmethod robot_audio::robot_semantemeResponse
  (:init
   (&key
    ((:tech __tech) "")
    ((:iat __iat) "")
    ((:anwser __anwser) "")
    ((:intent __intent) "")
    ((:slots_name __slots_name) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:slots_value __slots_value) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _tech (string __tech))
   (setq _iat (string __iat))
   (setq _anwser (string __anwser))
   (setq _intent (string __intent))
   (setq _slots_name __slots_name)
   (setq _slots_value __slots_value)
   self)
  (:tech
   (&optional __tech)
   (if __tech (setq _tech __tech)) _tech)
  (:iat
   (&optional __iat)
   (if __iat (setq _iat __iat)) _iat)
  (:anwser
   (&optional __anwser)
   (if __anwser (setq _anwser __anwser)) _anwser)
  (:intent
   (&optional __intent)
   (if __intent (setq _intent __intent)) _intent)
  (:slots_name
   (&optional __slots_name)
   (if __slots_name (setq _slots_name __slots_name)) _slots_name)
  (:slots_value
   (&optional __slots_value)
   (if __slots_value (setq _slots_value __slots_value)) _slots_value)
  (:serialization-length
   ()
   (+
    ;; string _tech
    4 (length _tech)
    ;; string _iat
    4 (length _iat)
    ;; string _anwser
    4 (length _anwser)
    ;; string _intent
    4 (length _intent)
    ;; string[] _slots_name
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _slots_name)) 4
    ;; string[] _slots_value
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _slots_value)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _tech
       (write-long (length _tech) s) (princ _tech s)
     ;; string _iat
       (write-long (length _iat) s) (princ _iat s)
     ;; string _anwser
       (write-long (length _anwser) s) (princ _anwser s)
     ;; string _intent
       (write-long (length _intent) s) (princ _intent s)
     ;; string[] _slots_name
     (write-long (length _slots_name) s)
     (dolist (elem _slots_name)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _slots_value
     (write-long (length _slots_value) s)
     (dolist (elem _slots_value)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _tech
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _tech (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _iat
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _iat (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _anwser
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _anwser (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _intent
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _intent (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[] _slots_name
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _slots_name (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _slots_name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _slots_value
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _slots_value (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _slots_value i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass robot_audio::robot_semanteme
  :super ros::object
  :slots ())

(setf (get robot_audio::robot_semanteme :md5sum-) "137f770ca875cecbf1fccdae0ac71f77")
(setf (get robot_audio::robot_semanteme :datatype-) "robot_audio/robot_semanteme")
(setf (get robot_audio::robot_semanteme :request) robot_audio::robot_semantemeRequest)
(setf (get robot_audio::robot_semanteme :response) robot_audio::robot_semantemeResponse)

(defmethod robot_audio::robot_semantemeRequest
  (:response () (instance robot_audio::robot_semantemeResponse :init)))

(setf (get robot_audio::robot_semantemeRequest :md5sum-) "137f770ca875cecbf1fccdae0ac71f77")
(setf (get robot_audio::robot_semantemeRequest :datatype-) "robot_audio/robot_semantemeRequest")
(setf (get robot_audio::robot_semantemeRequest :definition-)
      "int32 mode
string textorpath
---
string tech
string iat
string anwser
string intent
string[] slots_name
string[] slots_value

")

(setf (get robot_audio::robot_semantemeResponse :md5sum-) "137f770ca875cecbf1fccdae0ac71f77")
(setf (get robot_audio::robot_semantemeResponse :datatype-) "robot_audio/robot_semantemeResponse")
(setf (get robot_audio::robot_semantemeResponse :definition-)
      "int32 mode
string textorpath
---
string tech
string iat
string anwser
string intent
string[] slots_name
string[] slots_value

")



(provide :robot_audio/robot_semanteme "137f770ca875cecbf1fccdae0ac71f77")


