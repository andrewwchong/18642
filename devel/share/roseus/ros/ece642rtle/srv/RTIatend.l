;; Auto-generated. Do not edit!


(when (boundp 'ece642rtle::RTIatend)
  (if (not (find-package "ECE642RTLE"))
    (make-package "ECE642RTLE"))
  (shadow 'RTIatend (find-package "ECE642RTLE")))
(unless (find-package "ECE642RTLE::RTIATEND")
  (make-package "ECE642RTLE::RTIATEND"))
(unless (find-package "ECE642RTLE::RTIATENDREQUEST")
  (make-package "ECE642RTLE::RTIATENDREQUEST"))
(unless (find-package "ECE642RTLE::RTIATENDRESPONSE")
  (make-package "ECE642RTLE::RTIATENDRESPONSE"))

(in-package "ROS")





(defclass ece642rtle::RTIatendRequest
  :super ros::object
  :slots (_t _x _y ))

(defmethod ece642rtle::RTIatendRequest
  (:init
   (&key
    ((:t __t) (instance ros::time :init))
    ((:x __x) 0)
    ((:y __y) 0)
    )
   (send-super :init)
   (setq _t __t)
   (setq _x (round __x))
   (setq _y (round __y))
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
  (:serialization-length
   ()
   (+
    ;; time _t
    8
    ;; int8 _x
    1
    ;; int8 _y
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _t
       (write-long (send _t :sec) s) (write-long (send _t :nsec) s)
     ;; int8 _x
       (write-byte _x s)
     ;; int8 _y
       (write-byte _y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _t
     (send _t :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _t :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int8 _x
     (setq _x (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _x 127) (setq _x (- _x 256)))
   ;; int8 _y
     (setq _y (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _y 127) (setq _y (- _y 256)))
   ;;
   self)
  )

(defclass ece642rtle::RTIatendResponse
  :super ros::object
  :slots (_atend ))

(defmethod ece642rtle::RTIatendResponse
  (:init
   (&key
    ((:atend __atend) nil)
    )
   (send-super :init)
   (setq _atend __atend)
   self)
  (:atend
   (&optional __atend)
   (if __atend (setq _atend __atend)) _atend)
  (:serialization-length
   ()
   (+
    ;; bool _atend
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _atend
       (if _atend (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _atend
     (setq _atend (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass ece642rtle::RTIatend
  :super ros::object
  :slots ())

(setf (get ece642rtle::RTIatend :md5sum-) "601274b2c558d8c19960f10fd7863a32")
(setf (get ece642rtle::RTIatend :datatype-) "ece642rtle/RTIatend")
(setf (get ece642rtle::RTIatend :request) ece642rtle::RTIatendRequest)
(setf (get ece642rtle::RTIatend :response) ece642rtle::RTIatendResponse)

(defmethod ece642rtle::RTIatendRequest
  (:response () (instance ece642rtle::RTIatendResponse :init)))

(setf (get ece642rtle::RTIatendRequest :md5sum-) "601274b2c558d8c19960f10fd7863a32")
(setf (get ece642rtle::RTIatendRequest :datatype-) "ece642rtle/RTIatendRequest")
(setf (get ece642rtle::RTIatendRequest :definition-)
      "time t
int8 x
int8 y
---
bool atend

")

(setf (get ece642rtle::RTIatendResponse :md5sum-) "601274b2c558d8c19960f10fd7863a32")
(setf (get ece642rtle::RTIatendResponse :datatype-) "ece642rtle/RTIatendResponse")
(setf (get ece642rtle::RTIatendResponse :definition-)
      "time t
int8 x
int8 y
---
bool atend

")



(provide :ece642rtle/RTIatend "601274b2c558d8c19960f10fd7863a32")


