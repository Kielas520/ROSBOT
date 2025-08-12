;; Auto-generated. Do not edit!


(when (boundp 'face_rec::face_results)
  (if (not (find-package "FACE_REC"))
    (make-package "FACE_REC"))
  (shadow 'face_results (find-package "FACE_REC")))
(unless (find-package "FACE_REC::FACE_RESULTS")
  (make-package "FACE_REC::FACE_RESULTS"))

(in-package "ROS")
;;//! \htmlinclude face_results.msg.html


(defclass face_rec::face_results
  :super ros::object
  :slots (_num _face_data ))

(defmethod face_rec::face_results
  (:init
   (&key
    ((:num __num) 0)
    ((:face_data __face_data) ())
    )
   (send-super :init)
   (setq _num (round __num))
   (setq _face_data __face_data)
   self)
  (:num
   (&optional __num)
   (if __num (setq _num __num)) _num)
  (:face_data
   (&rest __face_data)
   (if (keywordp (car __face_data))
       (send* _face_data __face_data)
     (progn
       (if __face_data (setq _face_data (car __face_data)))
       _face_data)))
  (:serialization-length
   ()
   (+
    ;; uint8 _num
    1
    ;; face_rec/face_data[] _face_data
    (apply #'+ (send-all _face_data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _num
       (write-byte _num s)
     ;; face_rec/face_data[] _face_data
     (write-long (length _face_data) s)
     (dolist (elem _face_data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _num
     (setq _num (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; face_rec/face_data[] _face_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _face_data (let (r) (dotimes (i n) (push (instance face_rec::face_data :init) r)) r))
     (dolist (elem- _face_data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get face_rec::face_results :md5sum-) "3582c39ba7ba2498c9e7ea9f75703724")
(setf (get face_rec::face_results :datatype-) "face_rec/face_results")
(setf (get face_rec::face_results :definition-)
      "uint8 num
face_rec/face_data[] face_data
================================================================================
MSG: face_rec/face_data
string name
float64 xmin
float64 xmax
float64 ymin
float64 ymax
")



(provide :face_rec/face_results "3582c39ba7ba2498c9e7ea9f75703724")


