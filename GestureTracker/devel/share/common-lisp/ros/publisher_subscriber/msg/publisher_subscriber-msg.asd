
(cl:in-package :asdf)

(defsystem "publisher_subscriber-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :nuitrack_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "EventUserUpdate" :depends-on ("_package_EventUserUpdate"))
    (:file "_package_EventUserUpdate" :depends-on ("_package"))
    (:file "GestureInformation" :depends-on ("_package_GestureInformation"))
    (:file "_package_GestureInformation" :depends-on ("_package"))
    (:file "SkeletonData" :depends-on ("_package_SkeletonData"))
    (:file "_package_SkeletonData" :depends-on ("_package"))
    (:file "SkeletonDataArray" :depends-on ("_package_SkeletonDataArray"))
    (:file "_package_SkeletonDataArray" :depends-on ("_package"))
    (:file "UserData" :depends-on ("_package_UserData"))
    (:file "_package_UserData" :depends-on ("_package"))
    (:file "UserDataArray" :depends-on ("_package_UserDataArray"))
    (:file "_package_UserDataArray" :depends-on ("_package"))
  ))