
(cl:in-package :asdf)

(defsystem "publisher_subscriber-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GestureInformation" :depends-on ("_package_GestureInformation"))
    (:file "_package_GestureInformation" :depends-on ("_package"))
  ))