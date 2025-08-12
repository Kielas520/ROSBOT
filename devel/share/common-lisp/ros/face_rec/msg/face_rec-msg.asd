
(cl:in-package :asdf)

(defsystem "face_rec-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "face_data" :depends-on ("_package_face_data"))
    (:file "_package_face_data" :depends-on ("_package"))
    (:file "face_results" :depends-on ("_package_face_results"))
    (:file "_package_face_results" :depends-on ("_package"))
  ))