(in-package #:a21.day-3)

(defun prompt (part)
  (utils:echo-prompt 3 part))

(defun part-1 ()
  (let* ((counter (do* ((input-lines (utils:read-file-lines "inputs/day3.txt") (cdr input-lines))
                        (input-width (length (car input-lines)))
                        (index 0 (1+ index))
                        (current-line (car input-lines)
                                      (car input-lines))
                        (counter (make-array input-width :initial-element 0)))
                       ((null input-lines) counter)
                    (dotimes (idx input-width)
                      (if (eq #\0 (aref current-line idx))
                          (decf (aref counter idx))
                          (incf (aref counter idx))))))
         (anti-counter (make-array (array-total-size counter) :initial-element 0)))
    (dotimes (idx (length counter))
      (if (> (aref counter idx) 0)
          (setf (aref counter idx) #\1
                (aref anti-counter idx) #\0)
          (setf (aref counter idx) #\0
                (aref anti-counter idx) #\1)))
    (let ((gamma (read-from-string (format nil "#b~a" (coerce counter 'string))))
          (epsilon (read-from-string (format nil "#b~a" (coerce anti-counter 'string)))))
      (* gamma epsilon))))

;; positive: 1, negative: 0, 0 : same
(defun most-common-bit (strings index)
  (let ((counter 0))
    (dolist (string strings)
      (if (char= #\0 (aref string index))
          (decf counter)
          (incf counter)))
    counter))

(defun bit->char (bit)
  (ccase bit
    (0 #\0)
    (1 #\1)))

(defun char->bit (char)
  (ccase char
    (#\0 0)
    (#\1 1)))

(defun filter-by-index (strings index bit)
  (let (result)
    (dolist (string strings)
      (when (char= (bit->char bit) (aref string index))
        (push string result)))
    result))

(defun oxygen-scrubber-rating (input-strings)
  (do* ((index 0 (1+ index))
        (lines (filter-by-index input-strings 0 (if (<= 0 (most-common-bit input-strings 0))
                                                    1
                                                    0))
               (filter-by-index lines index (if (<= 0 (most-common-bit lines index))
                                                1
                                                0))))
       ((= 1 (length lines)) (read-from-string (format nil "#b~a" (car lines))))
    (format t "Index: ~d~&" index)
    (format t "Most common bit at index ~d: ~d~&" index (let ((mcb (most-common-bit lines index)))
                                                          (cond
                                                            ((zerop mcb) "Tie!")
                                                            ((> mcb 0) 1)
                                                            ((< mcb 0) 0))))
    (format t "lines:~&~a~&" lines)))

(defun co2-scrubber-rating (input-strings)
  (do* ((index 0 (1+ index))
        (lines (filter-by-index input-strings 0 (if (>= 0 (most-common-bit input-strings 0))
                                                    0
                                                    1))
               (filter-by-index lines index (if (>= 0 (most-common-bit lines index))
                                                0
                                                1))))
       ((= 1 (length lines)) (read-from-string (format nil "#b~a" (car lines))))))

(defun part-2 ()
  (let ((input-lines (utils:read-file-lines "inputs/day3.txt")))
    (* (oxygen-scrubber-rating input-lines)
       (co2-scrubber-rating input-lines))))
