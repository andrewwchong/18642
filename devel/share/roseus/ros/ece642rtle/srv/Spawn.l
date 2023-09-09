;; Auto-generated. Do not edit!


(when (boundp 'ece642rtle::Spawn)
  (if (not (find-package "ECE642RTLE"))
    (make-package "ECE642RTLE"))
  (shadow 'Spawn (find-package "ECE642RTLE")))
(unless (find-package "ECE642RTLE::SPAWN")
  (make-package "ECE642RTLE::SPAWN"))
(unless (find-package "ECE642RTLE::SPAWNREQUEST")
  (make-package "ECE642RTLE::SPAWNREQUEST"))
(unless (find-package "ECE642RTLE::SPAWNRESPONSE")
  (make-package "ECE642RTLE::SPAWNRESPONSE"))

(in-package "ROS")





(defclass ece642rtle::SpawnRequest
  :super ros::object
  :slots (_x _y _theta _name ))

(defmethod ece642rtle::SpawnRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:name __name) "")
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   (setq _name (string __name))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _theta
    4
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ece642rtle::SpawnResponse
  :super ros::object
  :slots (_name ))

(defmethod ece642rtle::SpawnResponse
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

(defclass ece642rtle::Spawn
  :super ros::object
  :slots ())

(setf (get ece642rtle::Spawn :md5sum-) "0b2d2e872a8e2887d5ed626f2bf2c561")
(setf (get ece642rtle::Spawn :datatype-) "ece642rtle/Spawn")
(setf (get ece642rtle::Spawn :request) ece642rtle::SpawnRequest)
(setf (get ece642rtle::Spawn :response) ece642rtle::SpawnResponse)

(defmethod ece642rtle::SpawnRequest
  (:response () (instance ece642rtle::SpawnResponse :init)))

(setf (get ece642rtle::SpawnRequest :md5sum-) "0b2d2e872a8e2887d5ed626f2bf2c561")
(setf (get ece642rtle::SpawnRequest :datatype-) "ece642rtle/SpawnRequest")
(setf (get ece642rtle::SpawnRequest :definition-)
      "float32 x
float32 y
float32 theta
string name
---
string name
")

(setf (get ece642rtle::SpawnResponse :md5sum-) "0b2d2e872a8e2887d5ed626f2bf2c561")
(setf (get ece642rtle::SpawnResponse :datatype-) "ece642rtle/SpawnResponse")
(setf (get ece642rtle::SpawnResponse :definition-)
      "float32 x
float32 y
float32 theta
string name
---
string name
")



(provide :ece642rtle/Spawn "0b2d2e872a8e2887d5ed626f2bf2c561")


