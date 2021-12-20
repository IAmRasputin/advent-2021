;;;; package.lisp

(defpackage #:a21.utils
  (:use #:cl)
  (:export
   :read-file-lines
   :echo-prompt
   :while
   :sum))

(defpackage #:a21.day-1
  (:use #:cl)
  (:local-nicknames (:utils :a21.utils))
  (:export
   :prompt
   :part-1
   :part-2))

(defpackage #:a21.day-2
  (:use #:cl)
  (:local-nicknames (:utils :a21.utils))
  (:export
   :prompt
   :part-1
   :part-2))

(defpackage #:a21.day-3
  (:use #:cl)
  (:local-nicknames (:utils :a21.utils))
  (:export
   :prompt
   :part-1
   :part-2))

(defpackage #:advent-2021
  (:use #:cl)
  (:local-nicknames
   (:utils :a21.utils)
   (:day-1 :a21.day-1)
   (:day-2 :a21.day-2)
   (:day-3 :a21.day-3)))
