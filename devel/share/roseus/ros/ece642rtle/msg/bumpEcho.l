;; Auto-generated. Do not edit!


(when (boundp 'ece642rtle::bumpEcho)
  (if (not (find-package "ECE642RTLE"))
    (make-package "ECE642RTLE"))
  (shadow 'bumpEcho (find-package "ECE642RTLE")))
(unless (find-package "ECE642RTLE::BUMPECHO")
  (make-package "ECE642RTLE::BUMPECHO"))

(in-package "ROS")
;;//! \htmlinclude bumpEcho.msg.html


(defclass ece642rtle::bumpEcho
  :super ros::object
  :slots (_t _x1 _y1 _x2 _y2 _resp ))

(defmethod ece642rtle::bumpEcho
  (:init
   (&key
    ((:t __t) (instance ros::time :init))
    ((:x1 __x1) 0)
    ((:y1 __y1) 0)
    ((:x2 __x2) 0)
    ((:y2 __y2) 0)
    ((:resp __resp) nil)
    )
   (send-super :init)
   (setq _t __t)
   (setq _x1 (round __x1))
   (setq _y1 (round __y1))
   (setq _x2 (round __x2))
   (setq _y2 (round __y2))
   (setq _resp __resp)
   self)
  (:t
   (&optional __t)
   (if __t (setq _t __t)) _t)
  (:x1
   (&optional __x1)
   (if __x1 (setq _x1 __x1)) _x1)
  (:y1
   (&optional __y1)
   (if __y1 (setq _y1 __y1)) _y1)
  (:x2
   (&optional __x2)
   (if __x2 (setq _x2 __x2)) _x2)
  (:y2
   (&optional __y2)
   (if __y2 (setq _y2 __y2)) _y2)
  (:resp
   (&optional __resp)
   (if __resp (setq _resp __resp)) _resp)
  (:serialization-length
   ()
   (+
    ;; time _t
    8
    ;; int32 _x1
    4
    ;; int32 _y1
    4
    ;; int32 _x2
    4
    ;; int32 _y2
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
     ;; int32 _x1
       (write-long _x1 s)
     ;; int32 _y1
       (write-long _y1 s)
     ;; int32 _x2
       (write-long _x2 s)
     ;; int32 _y2
       (write-long _y2 s)
     ;; bool _resp
       (if _resp (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _t
     (send _t :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _t :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _x1
     (setq _x1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y1
     (setq _y1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _x2
     (setq _x2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y2
     (setq _y2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _resp
     (setq _resp (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ece642rtle::bumpEcho :md5sum-) "4f39b12694464cc7a7e355caf0f0ec3c")
(setf (get ece642rtle::bumpEcho :datatype-) "ece642rtle/bumpEcho")
(setf (get ece642rtle::bumpEcho :definition-)
      "time t
int32 x1
int32 y1
int32 x2
int32 y2
bool resp


")



(provide :ece642rtle/bumpEcho "4f39b12694464cc7a7e355caf0f0ec3c")


