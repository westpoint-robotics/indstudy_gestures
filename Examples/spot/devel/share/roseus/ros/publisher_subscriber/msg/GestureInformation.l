;; Auto-generated. Do not edit!


(when (boundp 'publisher_subscriber::GestureInformation)
  (if (not (find-package "PUBLISHER_SUBSCRIBER"))
    (make-package "PUBLISHER_SUBSCRIBER"))
  (shadow 'GestureInformation (find-package "PUBLISHER_SUBSCRIBER")))
(unless (find-package "PUBLISHER_SUBSCRIBER::GESTUREINFORMATION")
  (make-package "PUBLISHER_SUBSCRIBER::GESTUREINFORMATION"))

(in-package "ROS")
;;//! \htmlinclude GestureInformation.msg.html


(defclass publisher_subscriber::GestureInformation
  :super ros::object
  :slots (_user_id _gesture_id _gesture_name ))

(defmethod publisher_subscriber::GestureInformation
  (:init
   (&key
    ((:user_id __user_id) 0)
    ((:gesture_id __gesture_id) 0)
    ((:gesture_name __gesture_name) "")
    )
   (send-super :init)
   (setq _user_id (round __user_id))
   (setq _gesture_id (round __gesture_id))
   (setq _gesture_name (string __gesture_name))
   self)
  (:user_id
   (&optional __user_id)
   (if __user_id (setq _user_id __user_id)) _user_id)
  (:gesture_id
   (&optional __gesture_id)
   (if __gesture_id (setq _gesture_id __gesture_id)) _gesture_id)
  (:gesture_name
   (&optional __gesture_name)
   (if __gesture_name (setq _gesture_name __gesture_name)) _gesture_name)
  (:serialization-length
   ()
   (+
    ;; uint16 _user_id
    2
    ;; uint16 _gesture_id
    2
    ;; string _gesture_name
    4 (length _gesture_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _user_id
       (write-word _user_id s)
     ;; uint16 _gesture_id
       (write-word _gesture_id s)
     ;; string _gesture_name
       (write-long (length _gesture_name) s) (princ _gesture_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _user_id
     (setq _user_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _gesture_id
     (setq _gesture_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; string _gesture_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _gesture_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get publisher_subscriber::GestureInformation :md5sum-) "3cf88e91afe598ebbb2355758ea13cb1")
(setf (get publisher_subscriber::GestureInformation :datatype-) "publisher_subscriber/GestureInformation")
(setf (get publisher_subscriber::GestureInformation :definition-)
      "uint16 user_id
uint16 gesture_id
string gesture_name

")



(provide :publisher_subscriber/GestureInformation "3cf88e91afe598ebbb2355758ea13cb1")


