
(cl:in-package :asdf)

(defsystem "relative_move-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "SetRelativeMove" :depends-on ("_package_SetRelativeMove"))
    (:file "_package_SetRelativeMove" :depends-on ("_package"))
  ))