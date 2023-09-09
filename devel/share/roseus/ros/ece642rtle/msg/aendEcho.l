;; Auto-generated. Do not edit!


(when (boundp 'ece642rtle::aendEcho)
  (if (not (find-package "ECE642RTLE"))
    (make-package "ECE642RTLE"))
  (shadow 'aendEcho (find-package "ECE642RTLE")))
(unless (find-package "ECE642RTLE::AENDECHO")
  (make-package "ECE642RTLE::AENDECHO"))

(in-package "ROS")
;;//! \htmlinclude aendEcho.msg.html


(defclass ece642rtle::aendEcho
  :super ros::object
  :slots (_t _x _y _resp ))

(defmethod ece642rtle::aendEcho
  (:init
   (&key
    ((:t __t) (instance ros::time :init))
    ((:x __x) 0)
    ((:y __y) 0)
    ((:resp __resp) nil)
    )
   (send-super :init)
   (setq _t __t)
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _resp __resp)
   self)
  (:t
   (&optional __t)
   (if __t (setq _t __t)) _t)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:resp
   (&optional __resp)
   (if __resp (setq _resp __resp)) _resp)
  (:serialization-length
   ()
   (+
    ;; time _t
    8
    ;; int32 _x
    4
    ;; int32 _y
    4
    ;; bool _resp
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _t
       (write-long (send _t :sec) s) (write-long (send _t :nsec) s)
     ;; int32 _x
       (write-long _x s)
     ;; int32 _y
       (write-long _y s)
     ;; bool _resp
       (if _resp (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _t
     (send _t :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _t :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _x
     (setq _x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y
     (setq _y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _resp
     (setq _resp (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ece642rtle::aendEcho :md5sum-) "6caf0aa0b7507bce1ec993aba0f1642b")
(setf (get ece642rtle::aendEcho :datatype-) "ece642rtle/aendEcho")
(setf (get ece642rtle::aendEcho :definition-)
      "time t
int32 x
int32 y
bool resp


")



(provide :ece642rtle/aendEcho "6caf0aa0b7507bce1ec993aba0f1642b")


