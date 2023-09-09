; Auto-generated. Do not edit!


(cl:in-package ece642rtle-msg)


;//! \htmlinclude aendEcho.msg.html

(cl:defclass <aendEcho> (roslisp-msg-protocol:ros-message)
  ((t
    :reader t
    :initarg :t
    :type cl:real
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0)
   (resp
    :reader resp
    :initarg :resp
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass aendEcho (<aendEcho>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <aendEcho>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'aendEcho)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ece642rtle-msg:<aendEcho> is deprecated: use ece642rtle-msg:aendEcho instead.")))

(cl:ensure-generic-function 't-val :lambda-list '(m))
(cl:defmethod t-val ((m <aendEcho>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-msg:t-val is deprecated.  Use ece642rtle-msg:t instead.")
  (t m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <aendEcho>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-msg:x-val is deprecated.  Use ece642rtle-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <aendEcho>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-msg:y-val is deprecated.  Use ece642rtle-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'resp-val :lambda-list '(m))
(cl:defmethod resp-val ((m <aendEcho>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-msg:resp-val is deprecated.  Use ece642rtle-msg:resp instead.")
  (resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <aendEcho>) ostream)
  "Serializes a message object of type '<aendEcho>"
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
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'resp) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <aendEcho>) istream)
  "Deserializes a message object of type '<aendEcho>"
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
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'resp) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<aendEcho>)))
  "Returns string type for a message object of type '<aendEcho>"
  "ece642rtle/aendEcho")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'aendEcho)))
  "Returns string type for a message object of type 'aendEcho"
  "ece642rtle/aendEcho")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<aendEcho>)))
  "Returns md5sum for a message object of type '<aendEcho>"
  "6caf0aa0b7507bce1ec993aba0f1642b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'aendEcho)))
  "Returns md5sum for a message object of type 'aendEcho"
  "6caf0aa0b7507bce1ec993aba0f1642b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<aendEcho>)))
  "Returns full string definition for message of type '<aendEcho>"
  (cl:format cl:nil "time t~%int32 x~%int32 y~%bool resp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'aendEcho)))
  "Returns full string definition for message of type 'aendEcho"
  (cl:format cl:nil "time t~%int32 x~%int32 y~%bool resp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <aendEcho>))
  (cl:+ 0
     8
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <aendEcho>))
  "Converts a ROS message object to a list"
  (cl:list 'aendEcho
    (cl:cons ':t (t msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':resp (resp msg))
))
