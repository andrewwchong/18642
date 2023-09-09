;; Auto-generated. Do not edit!


(when (boundp 'ece642rtle::RTIbump)
  (if (not (find-package "ECE642RTLE"))
    (make-package "ECE642RTLE"))
  (shadow 'RTIbump (find-package "ECE642RTLE")))
(unless (find-package "ECE642RTLE::RTIBUMP")
  (make-package "ECE642RTLE::RTIBUMP"))
(unless (find-package "ECE642RTLE::RTIBUMPREQUEST")
  (make-package "ECE642RTLE::RTIBUMPREQUEST"))
(unless (find-package "ECE642RTLE::RTIBUMPRESPONSE")
  (make-package "ECE642RTLE::RTIBUMPRESPONSE"))

(in-package "ROS")





(defclass ece642rtle::RTIbumpRequest
  :super ros::object
  :slots (_t _x1 _y1 _x2 _y2 ))

(defmethod ece642rtle::RTIbumpRequest
  (:init
   (&key
    ((:t __t) (instance ros::time :init))
    ((:x1 __x1) 0)
    ((:y1 __y1) 0)
    ((:x2 __x2) 0)
    ((:y2 __y2) 0)
    )
   (send-super :init)
   (setq _t __t)
   (setq _x1 (round __x1))
   (setq _y1 (round __y1))
   (setq _x2 (round __x2))
   (setq _y2 (round __y2))
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
  (:serialization-length
   ()
   (+
    ;; time _t
    8
    ;; int8 _x1
    1
    ;; int8 _y1
    1
    ;; int8 _x2
    1
    ;; int8 _y2
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _t
       (write-long (send _t :sec) s) (write-long (send _t :nsec) s)
     ;; int8 _x1
       (write-byte _x1 s)
     ;; int8 _y1
       (write-byte _y1 s)
     ;; int8 _x2
       (write-byte _x2 s)
     ;; int8 _y2
       (write-byte _y2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _t
     (send _t :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _t :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int8 _x1
     (setq _x1 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _x1 127) (setq _x1 (- _x1 256)))
   ;; int8 _y1
     (setq _y1 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _y1 127) (setq _y1 (- _y1 256)))
   ;; int8 _x2
     (setq _x2 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _x2 127) (setq _x2 (- _x2 256)))
   ;; int8 _y2
     (setq _y2 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _y2 127) (setq _y2 (- _y2 256)))
   ;;
   self)
  )

(defclass ece642rtle::RTIbumpResponse
  :super ros::object
  :slots (_bump ))

(defmethod ece642rtle::RTIbumpResponse
  (:init
   (&key
    ((:bump __bump) nil)
    )
   (send-super :init)
   (setq _bump __bump)
   self)
  (:bump
   (&optional __bump)
   (if __bump (setq _bump __bump)) _bump)
  (:serialization-length
   ()
   (+
    ;; bool _bump
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _bump
       (if _bump (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _bump
     (setq _bump (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass ece642rtle::RTIbump
  :super ros::object
  :slots ())

(setf (get ece642rtle::RTIbump :md5sum-) "572d9da764261393a9c6c33976c42dac")
(setf (get ece642rtle::RTIbump :datatype-) "ece642rtle/RTIbump")
(setf (get ece642rtle::RTIbump :request) ece642rtle::RTIbumpRequest)
(setf (get ece642rtle::RTIbump :response) ece642rtle::RTIbumpResponse)

(defmethod ece642rtle::RTIbumpRequest
  (:response () (instance ece642rtle::RTIbumpResponse :init)))

(setf (get ece642rtle::RTIbumpRequest :md5sum-) "572d9da764261393a9c6c33976c42dac")
(setf (get ece642rtle::RTIbumpRequest :datatype-) "ece642rtle/RTIbumpRequest")
(setf (get ece642rtle::RTIbumpRequest :definition-)
      "time t
int8 x1
int8 y1
int8 x2
int8 y2
---
bool bump
")

(setf (get ece642rtle::RTIbumpResponse :md5sum-) "572d9da764261393a9c6c33976c42dac")
(setf (get ece642rtle::RTIbumpResponse :datatype-) "ece642rtle/RTIbumpResponse")
(setf (get ece642rtle::RTIbumpResponse :definition-)
      "time t
int8 x1
int8 y1
int8 x2
int8 y2
---
bool bump
")



(provide :ece642rtle/RTIbump "572d9da764261393a9c6c33976c42dac")


