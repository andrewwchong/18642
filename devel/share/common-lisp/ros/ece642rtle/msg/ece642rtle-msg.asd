
(cl:in-package :asdf)

(defsystem "ece642rtle-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PoseOrntBundle" :depends-on ("_package_PoseOrntBundle"))
    (:file "_package_PoseOrntBundle" :depends-on ("_package"))
    (:file "aendEcho" :depends-on ("_package_aendEcho"))
    (:file "_package_aendEcho" :depends-on ("_package"))
    (:file "bumpEcho" :depends-on ("_package_bumpEcho"))
    (:file "_package_bumpEcho" :depends-on ("_package"))
    (:file "timeInt8" :depends-on ("_package_timeInt8"))
    (:file "_package_timeInt8" :depends-on ("_package"))
  ))