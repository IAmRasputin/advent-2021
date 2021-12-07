(in-package #:a21.utils)

(defun read-file-lines (filepath &optional parse-as)
  (uiop:with-safe-io-syntax ()
      (let ((lines (uiop:read-file-lines filepath))
            ;; Parsers for various types can go here as I write them
            (parse-fn (case parse-as
                        (integer #'parse-integer)
                        (otherwise #'identity))))
        (mapcar parse-fn lines))))

(defun echo-prompt (day part)
  (uiop:with-safe-io-syntax ()
    (let* ((filepath (format nil "prompts/day~d-~d.txt" day part))
           (prompt (uiop:read-file-string filepath)))
      (format t "~a~&" prompt))))

;; Because this isn't in the fucking standard for some reason
(defmacro while (pred &body body)
  `(do ()
       ((not ,pred))
     ,@body))

(defun sum (list)
  (let ((without-null (mapcar (lambda (input)
                                (if (null input)
                                    0
                                    input))
                              list)))
    (apply #'+ without-null)))
