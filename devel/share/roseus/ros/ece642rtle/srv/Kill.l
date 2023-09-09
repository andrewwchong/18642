;; Auto-generated. Do not edit!


(when (boundp 'ece642rtle::Kill)
  (if (not (find-package "ECE642RTLE"))
    (make-package "ECE642RTLE"))
  (shadow 'Kill (find-package "ECE642RTLE")))
(unless (find-package "ECE642RTLE::KILL")
  (make-package "ECE642RTLE::KILL"))
(unless (find-package "ECE642RTLE::KILLREQUEST")
  (make-package "ECE642RTLE::KILLREQUEST"))
(unless (find-package "ECE642RTLE::KILLRESPONSE")
  (make-package "ECE642RTLE::KILLRESPONSE"))

(in-package "ROS")





(defclass ece642rtle::KillRequest
  :super ros::object
  :slots (_name ))

(defmethod ece642rtle::KillRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ece642rtle::KillResponse
  :super ros::object
  :slots ())

(defmethod ece642rtle::KillResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass ece642rtle::Kill
  :super ros::object
  :slots ())

(setf (get ece642rtle::Kill :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get ece642rtle::Kill :datatype-) "ece642rtle/Kill")
(setf (get ece642rtle::Kill :request) ece642rtle::KillRequest)
(setf (get ece642rtle::Kill :response) ece642rtle::KillResponse)

(defmethod ece642rtle::KillRequest
  (:response () (instance ece642rtle::KillResponse :init)))

(setf (get ece642rtle::KillRequest :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get ece642rtle::KillRequest :datatype-) "ece642rtle/KillRequest")
(setf (get ece642rtle::KillRequest :definition-)
      "string name
---
")

(setf (get ece642rtle::KillResponse :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get ece642rtle::KillResponse :datatype-) "ece642rtle/KillResponse")
(setf (get ece642rtle::KillResponse :definition-)
      "string name
---
")



(provide :ece642rtle/Kill "c1f3d28f1b044c871e6eff2e9fc3c667")


