
(cl:in-package :asdf)

(defsystem "ar_pose-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "ArPose" :depends-on ("_package_ArPose"))
    (:file "_package_ArPose" :depends-on ("_package"))
  ))