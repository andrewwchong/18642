; Auto-generated. Do not edit!


(cl:in-package ece642rtle-srv)


;//! \htmlinclude RTIatend-request.msg.html

(cl:defclass <RTIatend-request> (roslisp-msg-protocol:ros-message)
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
    :initform 0))
)

(cl:defclass RTIatend-request (<RTIatend-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RTIatend-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RTIatend-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ece642rtle-srv:<RTIatend-request> is deprecated: use ece642rtle-srv:RTIatend-request instead.")))

(cl:ensure-generic-function 't-val :lambda-list '(m))
(cl:defmethod t-val ((m <RTIatend-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-srv:t-val is deprecated.  Use ece642rtle-srv:t instead.")
  (t m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <RTIatend-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-srv:x-val is deprecated.  Use ece642rtle-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <RTIatend-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-srv:y-val is deprecated.  Use ece642rtle-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RTIatend-request>) ostream)
  "Serializes a message object of type '<RTIatend-request>"
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RTIatend-request>) istream)
  "Deserializes a message object of type '<RTIatend-request>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RTIatend-request>)))
  "Returns string type for a service object of type '<RTIatend-request>"
  "ece642rtle/RTIatendRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RTIatend-request)))
  "Returns string type for a service object of type 'RTIatend-request"
  "ece642rtle/RTIatendRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RTIatend-request>)))
  "Returns md5sum for a message object of type '<RTIatend-request>"
  "601274b2c558d8c19960f10fd7863a32")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RTIatend-request)))
  "Returns md5sum for a message object of type 'RTIatend-request"
  "601274b2c558d8c19960f10fd7863a32")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RTIatend-request>)))
  "Returns full string definition for message of type '<RTIatend-request>"
  (cl:format cl:nil "time t~%int8 x~%int8 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RTIatend-request)))
  "Returns full string definition for message of type 'RTIatend-request"
  (cl:format cl:nil "time t~%int8 x~%int8 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RTIatend-request>))
  (cl:+ 0
     8
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RTIatend-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RTIatend-request
    (cl:cons ':t (t msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
;//! \htmlinclude RTIatend-response.msg.html

(cl:defclass <RTIatend-response> (roslisp-msg-protocol:ros-message)
  ((atend
    :reader atend
    :initarg :atend
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RTIatend-response (<RTIatend-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RTIatend-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RTIatend-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ece642rtle-srv:<RTIatend-response> is deprecated: use ece642rtle-srv:RTIatend-response instead.")))

(cl:ensure-generic-function 'atend-val :lambda-list '(m))
(cl:defmethod atend-val ((m <RTIatend-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ece642rtle-srv:atend-val is deprecated.  Use ece642rtle-srv:atend instead.")
  (atend m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RTIatend-response>) ostream)
  "Serializes a message object of type '<RTIatend-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'atend) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RTIatend-response>) istream)
  "Deserializes a message object of type '<RTIatend-response>"
    (cl:setf (cl:slot-value msg 'atend) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RTIatend-response>)))
  "Returns string type for a service object of type '<RTIatend-response>"
  "ece642rtle/RTIatendResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RTIatend-response)))
  "Returns string type for a service object of type 'RTIatend-response"
  "ece642rtle/RTIatendResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RTIatend-response>)))
  "Returns md5sum for a message object of type '<RTIatend-response>"
  "601274b2c558d8c19960f10fd7863a32")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RTIatend-response)))
  "Returns md5sum for a message object of type 'RTIatend-response"
  "601274b2c558d8c19960f10fd7863a32")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RTIatend-response>)))
  "Returns full string definition for message of type '<RTIatend-response>"
  (cl:format cl:nil "bool atend~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RTIatend-response)))
  "Returns full string definition for message of type 'RTIatend-response"
  (cl:format cl:nil "bool atend~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RTIatend-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RTIatend-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RTIatend-response
    (cl:cons ':atend (atend msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RTIatend)))
  'RTIatend-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RTIatend)))
  'RTIatend-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RTIatend)))
  "Returns string type for a service object of type '<RTIatend>"
  "ece642rtle/RTIatend")