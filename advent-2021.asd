;;;; advent-2021.asd

(asdf:defsystem #:advent-2021
  :description "Describe advent-2021 here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:str)
  :components ((:file "package")
               (:file "utils")
               (:file "day-1")
               (:file "day-2")
               (:file "day-3")
               (:file "day-4")))
