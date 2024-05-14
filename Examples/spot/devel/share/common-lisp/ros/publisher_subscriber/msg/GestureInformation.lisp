; Auto-generated. Do not edit!


(cl:in-package publisher_subscriber-msg)


;//! \htmlinclude GestureInformation.msg.html

(cl:defclass <GestureInformation> (roslisp-msg-protocol:ros-message)
  ((user_id
    :reader user_id
    :initarg :user_id
    :type cl:fixnum
    :initform 0)
   (gesture_id
    :reader gesture_id
    :initarg :gesture_id
    :type cl:fixnum
    :initform 0)
   (gesture_name
    :reader gesture_name
    :initarg :gesture_name
    :type cl:string
    :initform ""))
)

(cl:defclass GestureInformation (<GestureInformation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GestureInformation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GestureInformation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name publisher_subscriber-msg:<GestureInformation> is deprecated: use publisher_subscriber-msg:GestureInformation instead.")))

(cl:ensure-generic-function 'user_id-val :lambda-list '(m))
(cl:defmethod user_id-val ((m <GestureInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader publisher_subscriber-msg:user_id-val is deprecated.  Use publisher_subscriber-msg:user_id instead.")
  (user_id m))

(cl:ensure-generic-function 'gesture_id-val :lambda-list '(m))
(cl:defmethod gesture_id-val ((m <GestureInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader publisher_subscriber-msg:gesture_id-val is deprecated.  Use publisher_subscriber-msg:gesture_id instead.")
  (gesture_id m))

(cl:ensure-generic-function 'gesture_name-val :lambda-list '(m))
(cl:defmethod gesture_name-val ((m <GestureInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader publisher_subscriber-msg:gesture_name-val is deprecated.  Use publisher_subscriber-msg:gesture_name instead.")
  (gesture_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GestureInformation>) ostream)
  "Serializes a message object of type '<GestureInformation>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'user_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'user_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gesture_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'gesture_id)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gesture_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gesture_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GestureInformation>) istream)
  "Deserializes a message object of type '<GestureInformation>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'user_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'user_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gesture_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'gesture_id)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gesture_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gesture_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GestureInformation>)))
  "Returns string type for a message object of type '<GestureInformation>"
  "publisher_subscriber/GestureInformation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GestureInformation)))
  "Returns string type for a message object of type 'GestureInformation"
  "publisher_subscriber/GestureInformation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GestureInformation>)))
  "Returns md5sum for a message object of type '<GestureInformation>"
  "3cf88e91afe598ebbb2355758ea13cb1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GestureInformation)))
  "Returns md5sum for a message object of type 'GestureInformation"
  "3cf88e91afe598ebbb2355758ea13cb1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GestureInformation>)))
  "Returns full string definition for message of type '<GestureInformation>"
  (cl:format cl:nil "uint16 user_id~%uint16 gesture_id~%string gesture_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GestureInformation)))
  "Returns full string definition for message of type 'GestureInformation"
  (cl:format cl:nil "uint16 user_id~%uint16 gesture_id~%string gesture_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GestureInformation>))
  (cl:+ 0
     2
     2
     4 (cl:length (cl:slot-value msg 'gesture_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GestureInformation>))
  "Converts a ROS message object to a list"
  (cl:list 'GestureInformation
    (cl:cons ':user_id (user_id msg))
    (cl:cons ':gesture_id (gesture_id msg))
    (cl:cons ':gesture_name (gesture_name msg))
))
