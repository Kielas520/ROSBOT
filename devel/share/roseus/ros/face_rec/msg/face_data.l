;; Auto-generated. Do not edit!


(when (boundp 'face_rec::face_data)
  (if (not (find-package "FACE_REC"))
    (make-package "FACE_REC"))
  (shadow 'face_data (find-package "FACE_REC")))
(unless (find-package "FACE_REC::FACE_DATA")
  (make-package "FACE_REC::FACE_DATA"))

(in-package "ROS")
;;//! \htmlinclude face_data.msg.html


(defclass face_rec::face_data
  :super ros::object
  :slots (_name _xmin _xmax _ymin _ymax ))

(defmethod face_rec::face_data
  (:init
   (&key
    ((:name __name) "")
    ((:xmin __xmin) 0.0)
    ((:xmax __xmax) 0.0)
    ((:ymin __ymin) 0.0)
    ((:ymax __ymax) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _xmin (float __xmin))
   (setq _xmax (float __xmax))
   (setq _ymin (float __ymin))
   (setq _ymax (float __ymax))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:xmin
   (&optional __xmin)
   (if __xmin (setq _xmin __xmin)) _xmin)
  (:xmax
   (&optional __xmax)
   (if __xmax (setq _xmax __xmax)) _xmax)
  (:ymin
   (&optional __ymin)
   (if __ymin (setq _ymin __ymin)) _ymin)
  (:ymax
   (&optional __ymax)
   (if __ymax (setq _ymax __ymax)) _ymax)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float64 _xmin
    8
    ;; float64 _xmax
    8
    ;; float64 _ymin
    8
    ;; float64 _ymax
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float64 _xmin
       (sys::poke _xmin (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _xmax
       (sys::poke _xmax (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ymin
       (sys::poke _ymin (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ymax
       (sys::poke _ymax (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _xmin
     (setq _xmin (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _xmax
     (setq _xmax (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ymin
     (setq _ymin (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ymax
     (setq _ymax (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get face_rec::face_data :md5sum-) "cac4f3cdaff898e913e562b59bf6e65e")
(setf (get face_rec::face_data :datatype-) "face_rec/face_data")
(setf (get face_rec::face_data :definition-)
      "string name
float64 xmin
float64 xmax
float64 ymin
float64 ymax
")



(provide :face_rec/face_data "cac4f3cdaff898e913e562b59bf6e65e")


