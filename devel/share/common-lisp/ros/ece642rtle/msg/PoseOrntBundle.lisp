; Auto-generated. Do not edit!


(cl:in-package ece642rtle-msg)


;//! \htmlinclude PoseOrntBundle.msg.html

(cl:defclass <PoseOrntBundle> (roslisp-msg-protocol:ros-message)
  ((t
    :reader t
    :initarg :t
    :type cl:real
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:fixnum
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:fixnum
    :initform 0)
   (o
    :reader o
    :initarg :o
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PoseOrntBundle (<PoseOrntBundle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PoseOrntBundle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PoseOrntBundle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ece642rtle-msg:<PoseOrntBundle> is deprecated: use ece642rtle-msg:PoseOrntBundle instead.")))

(cl:ensure-generic-function 't-val :lambda-list '(m))
(cl:defmethod t-val ((m <PoseOrntBundle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-msg:t-val is deprecated.  Use ece642rtle-msg:t instead.")
  (t m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <PoseOrntBundle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-msg:x-val is deprecated.  Use ece642rtle-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <PoseOrntBundle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-msg:y-val is deprecated.  Use ece642rtle-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'o-val :lambda-list '(m))
(cl:defmethod o-val ((m <PoseOrntBundle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-msg:o-val is deprecated.  Use ece642rtle-msg:o instead.")
  (o m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PoseOrntBundle>) ostream)
  "Serializes a message object of type '<PoseOrntBundle>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 't)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 't) (cl:floor (cl:slot-value msg 't)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'o)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PoseOrntBundle>) istream)
  "Deserializes a message object of type '<PoseOrntBundle>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 't) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'o) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PoseOrntBundle>)))
  "Returns string type for a message object of type '<PoseOrntBundle>"
  "ece642rtle/PoseOrntBundle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PoseOrntBundle)))
  "Returns string type for a message object of type 'PoseOrntBundle"
  "ece642rtle/PoseOrntBundle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PoseOrntBundle>)))
  "Returns md5sum for a message object of type '<PoseOrntBundle>"
  "4bf56cff2846ddf0c7c3fbc294b28115")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PoseOrntBundle)))
  "Returns md5sum for a message object of type 'PoseOrntBundle"
  "4bf56cff2846ddf0c7c3fbc294b28115")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PoseOrntBundle>)))
  "Returns full string definition for message of type '<PoseOrntBundle>"
  (cl:format cl:nil "time t~%int8 x~%int8 y~%int8 o~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PoseOrntBundle)))
  "Returns full string definition for message of type 'PoseOrntBundle"
  (cl:format cl:nil "time t~%int8 x~%int8 y~%int8 o~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PoseOrntBundle>))
  (cl:+ 0
     8
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PoseOrntBundle>))
  "Converts a ROS message object to a list"
  (cl:list 'PoseOrntBundle
    (cl:cons ':t (t msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':o (o msg))
))
