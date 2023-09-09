;; Auto-generated. Do not edit!


(when (boundp 'ece642rtle::timeInt8)
  (if (not (find-package "ECE642RTLE"))
    (make-package "ECE642RTLE"))
  (shadow 'timeInt8 (find-package "ECE642RTLE")))
(unless (find-package "ECE642RTLE::TIMEINT8")
  (make-package "ECE642RTLE::TIMEINT8"))

(in-package "ROS")
;;//! \htmlinclude timeInt8.msg.html


(defclass ece642rtle::timeInt8
  :super ros::object
  :slots (_t _data ))

(defmethod ece642rtle::timeInt8
  (:init
   (&key
    ((:t __t) (instance ros::time :init))
    ((:data __data) 0)
    )
   (send-super :init)
   (setq _t __t)
   (setq _data (round __data))
   self)
  (:t
   (&optional __t)
   (if __t (setq _t __t)) _t)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; time _t
    8
    ;; int8 _data
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _t
       (write-long (send _t :sec) s) (write-long (send _t :nsec) s)
     ;; int8 _data
       (write-byte _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _t
     (send _t :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _t :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int8 _data
     (setq _data (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _data 127) (setq _data (- _data 256)))
   ;;
   self)
  )

(setf (get ece642rtle::timeInt8 :md5sum-) "9ab6d0dd70600c3c29e7123d70261d97")
(setf (get ece642rtle::timeInt8 :datatype-) "ece642rtle/timeInt8")
(setf (get ece642rtle::timeInt8 :definition-)
      "time t
int8 data
")



(provide :ece642rtle/timeInt8 "9ab6d0dd70600c3c29e7123d70261d97")


