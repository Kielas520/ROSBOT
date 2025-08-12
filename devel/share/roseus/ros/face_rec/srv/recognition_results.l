;; Auto-generated. Do not edit!


(when (boundp 'face_rec::recognition_results)
  (if (not (find-package "FACE_REC"))
    (make-package "FACE_REC"))
  (shadow 'recognition_results (find-package "FACE_REC")))
(unless (find-package "FACE_REC::RECOGNITION_RESULTS")
  (make-package "FACE_REC::RECOGNITION_RESULTS"))
(unless (find-package "FACE_REC::RECOGNITION_RESULTSREQUEST")
  (make-package "FACE_REC::RECOGNITION_RESULTSREQUEST"))
(unless (find-package "FACE_REC::RECOGNITION_RESULTSRESPONSE")
  (make-package "FACE_REC::RECOGNITION_RESULTSRESPONSE"))

(in-package "ROS")





(defclass face_rec::recognition_resultsRequest
  :super ros::object
  :slots (_mode _image_path ))

(defmethod face_rec::recognition_resultsRequest
  (:init
   (&key
    ((:mode __mode) 0)
    ((:image_path __image_path) "")
    )
   (send-super :init)
   (setq _mode (round __mode))
   (setq _image_path (string __image_path))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:image_path
   (&optional __image_path)
   (if __image_path (setq _image_path __image_path)) _image_path)
  (:serialization-length
   ()
   (+
    ;; int8 _mode
    1
    ;; string _image_path
    4 (length _image_path)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _mode
       (write-byte _mode s)
     ;; string _image_path
       (write-long (length _image_path) s) (princ _image_path s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _mode 127) (setq _mode (- _mode 256)))
   ;; string _image_path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _image_path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass face_rec::recognition_resultsResponse
  :super ros::object
  :slots (_result _success ))

(defmethod face_rec::recognition_resultsResponse
  (:init
   (&key
    ((:result __result) (instance face_rec::face_results :init))
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _result __result)
   (setq _success __success)
   self)
  (:result
   (&rest __result)
   (if (keywordp (car __result))
       (send* _result __result)
     (progn
       (if __result (setq _result (car __result)))
       _result)))
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; face_rec/face_results _result
    (send _result :serialization-length)
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; face_rec/face_results _result
       (send _result :serialize s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; face_rec/face_results _result
     (send _result :deserialize buf ptr-) (incf ptr- (send _result :serialization-length))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass face_rec::recognition_results
  :super ros::object
  :slots ())

(setf (get face_rec::recognition_results :md5sum-) "63688d89abce970a45bd24bcb017d875")
(setf (get face_rec::recognition_results :datatype-) "face_rec/recognition_results")
(setf (get face_rec::recognition_results :request) face_rec::recognition_resultsRequest)
(setf (get face_rec::recognition_results :response) face_rec::recognition_resultsResponse)

(defmethod face_rec::recognition_resultsRequest
  (:response () (instance face_rec::recognition_resultsResponse :init)))

(setf (get face_rec::recognition_resultsRequest :md5sum-) "63688d89abce970a45bd24bcb017d875")
(setf (get face_rec::recognition_resultsRequest :datatype-) "face_rec/recognition_resultsRequest")
(setf (get face_rec::recognition_resultsRequest :definition-)
      "int8 mode
string image_path
---
face_rec/face_results result
bool success

================================================================================
MSG: face_rec/face_results
uint8 num
face_rec/face_data[] face_data
================================================================================
MSG: face_rec/face_data
string name
float64 xmin
float64 xmax
float64 ymin
")

(setf (get face_rec::recognition_resultsResponse :md5sum-) "63688d89abce970a45bd24bcb017d875")
(setf (get face_rec::recognition_resultsResponse :datatype-) "face_rec/recognition_resultsResponse")
(setf (get face_rec::recognition_resultsResponse :definition-)
      "int8 mode
string image_path
---
face_rec/face_results result
bool success

================================================================================
MSG: face_rec/face_results
uint8 num
face_rec/face_data[] face_data
================================================================================
MSG: face_rec/face_data
string name
float64 xmin
float64 xmax
float64 ymin
")



(provide :face_rec/recognition_results "63688d89abce970a45bd24bcb017d875")


