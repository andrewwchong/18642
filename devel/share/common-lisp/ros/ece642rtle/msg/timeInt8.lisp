; Auto-generated. Do not edit!


(cl:in-package ece642rtle-msg)


;//! \htmlinclude timeInt8.msg.html

(cl:defclass <timeInt8> (roslisp-msg-protocol:ros-message)
  ((t
    :reader t
    :initarg :t
    :type cl:real
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type cl:fixnum
    :initform 0))
)

(cl:defclass timeInt8 (<timeInt8>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <timeInt8>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'timeInt8)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ece642rtle-msg:<timeInt8> is deprecated: use ece642rtle-msg:timeInt8 instead.")))

(cl:ensure-generic-function 't-val :lambda-list '(m))
(cl:defmethod t-val ((m <timeInt8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-msg:t-val is deprecated.  Use ece642rtle-msg:t instead.")
  (t m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <timeInt8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-msg:data-val is deprecated.  Use ece642rtle-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <timeInt8>) ostream)
  "Serializes a message object of type '<timeInt8>"
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
  (cl:let* ((signed (cl:slot-value msg 'data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <timeInt8>) istream)
  "Deserializes a message object of type '<timeInt8>"
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
      (cl:setf (cl:slot-value msg 'data) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<timeInt8>)))
  "Returns string type for a message object of type '<timeInt8>"
  "ece642rtle/timeInt8")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'timeInt8)))
  "Returns string type for a message object of type 'timeInt8"
  "ece642rtle/timeInt8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<timeInt8>)))
  "Returns md5sum for a message object of type '<timeInt8>"
  "9ab6d0dd70600c3c29e7123d70261d97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'timeInt8)))
  "Returns md5sum for a message object of type 'timeInt8"
  "9ab6d0dd70600c3c29e7123d70261d97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<timeInt8>)))
  "Returns full string definition for message of type '<timeInt8>"
  (cl:format cl:nil "time t~%int8 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'timeInt8)))
  "Returns full string definition for message of type 'timeInt8"
  (cl:format cl:nil "time t~%int8 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <timeInt8>))
  (cl:+ 0
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <timeInt8>))
  "Converts a ROS message object to a list"
  (cl:list 'timeInt8
    (cl:cons ':t (t msg))
    (cl:cons ':data (data msg))
))
