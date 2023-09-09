; Auto-generated. Do not edit!


(cl:in-package ece642rtle-srv)


;//! \htmlinclude RTIbump-request.msg.html

(cl:defclass <RTIbump-request> (roslisp-msg-protocol:ros-message)
  ((t
    :reader t
    :initarg :t
    :type cl:real
    :initform 0)
   (x1
    :reader x1
    :initarg :x1
    :type cl:fixnum
    :initform 0)
   (y1
    :reader y1
    :initarg :y1
    :type cl:fixnum
    :initform 0)
   (x2
    :reader x2
    :initarg :x2
    :type cl:fixnum
    :initform 0)
   (y2
    :reader y2
    :initarg :y2
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RTIbump-request (<RTIbump-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RTIbump-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RTIbump-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ece642rtle-srv:<RTIbump-request> is deprecated: use ece642rtle-srv:RTIbump-request instead.")))

(cl:ensure-generic-function 't-val :lambda-list '(m))
(cl:defmethod t-val ((m <RTIbump-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-srv:t-val is deprecated.  Use ece642rtle-srv:t instead.")
  (t m))

(cl:ensure-generic-function 'x1-val :lambda-list '(m))
(cl:defmethod x1-val ((m <RTIbump-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-srv:x1-val is deprecated.  Use ece642rtle-srv:x1 instead.")
  (x1 m))

(cl:ensure-generic-function 'y1-val :lambda-list '(m))
(cl:defmethod y1-val ((m <RTIbump-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-srv:y1-val is deprecated.  Use ece642rtle-srv:y1 instead.")
  (y1 m))

(cl:ensure-generic-function 'x2-val :lambda-list '(m))
(cl:defmethod x2-val ((m <RTIbump-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-srv:x2-val is deprecated.  Use ece642rtle-srv:x2 instead.")
  (x2 m))

(cl:ensure-generic-function 'y2-val :lambda-list '(m))
(cl:defmethod y2-val ((m <RTIbump-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-srv:y2-val is deprecated.  Use ece642rtle-srv:y2 instead.")
  (y2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RTIbump-request>) ostream)
  "Serializes a message object of type '<RTIbump-request>"
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
  (cl:let* ((signed (cl:slot-value msg 'x1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RTIbump-request>) istream)
  "Deserializes a message object of type '<RTIbump-request>"
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
      (cl:setf (cl:slot-value msg 'x1) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y1) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x2) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y2) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RTIbump-request>)))
  "Returns string type for a service object of type '<RTIbump-request>"
  "ece642rtle/RTIbumpRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RTIbump-request)))
  "Returns string type for a service object of type 'RTIbump-request"
  "ece642rtle/RTIbumpRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RTIbump-request>)))
  "Returns md5sum for a message object of type '<RTIbump-request>"
  "572d9da764261393a9c6c33976c42dac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RTIbump-request)))
  "Returns md5sum for a message object of type 'RTIbump-request"
  "572d9da764261393a9c6c33976c42dac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RTIbump-request>)))
  "Returns full string definition for message of type '<RTIbump-request>"
  (cl:format cl:nil "time t~%int8 x1~%int8 y1~%int8 x2~%int8 y2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RTIbump-request)))
  "Returns full string definition for message of type 'RTIbump-request"
  (cl:format cl:nil "time t~%int8 x1~%int8 y1~%int8 x2~%int8 y2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RTIbump-request>))
  (cl:+ 0
     8
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RTIbump-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RTIbump-request
    (cl:cons ':t (t msg))
    (cl:cons ':x1 (x1 msg))
    (cl:cons ':y1 (y1 msg))
    (cl:cons ':x2 (x2 msg))
    (cl:cons ':y2 (y2 msg))
))
;//! \htmlinclude RTIbump-response.msg.html

(cl:defclass <RTIbump-response> (roslisp-msg-protocol:ros-message)
  ((bump
    :reader bump
    :initarg :bump
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RTIbump-response (<RTIbump-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RTIbump-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RTIbump-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ece642rtle-srv:<RTIbump-response> is deprecated: use ece642rtle-srv:RTIbump-response instead.")))

(cl:ensure-generic-function 'bump-val :lambda-list '(m))
(cl:defmethod bump-val ((m <RTIbump-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-srv:bump-val is deprecated.  Use ece642rtle-srv:bump instead.")
  (bump m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RTIbump-response>) ostream)
  "Serializes a message object of type '<RTIbump-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bump) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RTIbump-response>) istream)
  "Deserializes a message object of type '<RTIbump-response>"
    (cl:setf (cl:slot-value msg 'bump) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RTIbump-response>)))
  "Returns string type for a service object of type '<RTIbump-response>"
  "ece642rtle/RTIbumpResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RTIbump-response)))
  "Returns string type for a service object of type 'RTIbump-response"
  "ece642rtle/RTIbumpResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RTIbump-response>)))
  "Returns md5sum for a message object of type '<RTIbump-response>"
  "572d9da764261393a9c6c33976c42dac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RTIbump-response)))
  "Returns md5sum for a message object of type 'RTIbump-response"
  "572d9da764261393a9c6c33976c42dac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RTIbump-response>)))
  "Returns full string definition for message of type '<RTIbump-response>"
  (cl:format cl:nil "bool bump~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RTIbump-response)))
  "Returns full string definition for message of type 'RTIbump-response"
  (cl:format cl:nil "bool bump~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RTIbump-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RTIbump-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RTIbump-response
    (cl:cons ':bump (bump msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RTIbump)))
  'RTIbump-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RTIbump)))
  'RTIbump-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RTIbump)))
  "Returns string type for a service object of type '<RTIbump>"
  "ece642rtle/RTIbump")