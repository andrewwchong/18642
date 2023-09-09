
(cl:in-package :asdf)

(defsystem "ece642rtle-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Kill" :depends-on ("_package_Kill"))
    (:file "_package_Kill" :depends-on ("_package"))
    (:file "RTIatend" :depends-on ("_package_RTIatend"))
    (:file "_package_RTIatend" :depends-on ("_package"))
    (:file "RTIbump" :depends-on ("_package_RTIbump"))
    (:file "_package_RTIbump" :depends-on ("_package"))
    (:file "Spawn" :depends-on ("_package_Spawn"))
    (:file "_package_Spawn" :depends-on ("_package"))
  ))