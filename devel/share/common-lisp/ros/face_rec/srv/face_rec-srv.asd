
(cl:in-package :asdf)

(defsystem "face_rec-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :face_rec-msg
)
  :components ((:file "_package")
    (:file "recognition_results" :depends-on ("_package_recognition_results"))
    (:file "_package_recognition_results" :depends-on ("_package"))
  ))