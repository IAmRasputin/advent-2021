(in-package #:a21.day-4)

(defun prompt (part)
  (utils:echo-prompt 4 part))

(defun load-input (input-file)
  (let* ((input-lines (utils:read-file-lines input-file))
         (input (mapcar #'parse-integer (str:split "," (car input-lines))))
         (board-lines (cdr input-lines))
         boards)
    (do* ((lines board-lines (cdr lines))
          (current-line (car lines) (car lines))
          (split-line (str:split-omit-nulls " " current-line)
                      (str:split-omit-nulls " " current-line))
          (current-board))
         ((null current-line) (progn
                                (push (make-array '(5 5) :initial-contents current-board) boards)
                                (values input (reverse boards))))
      (if (null split-line)
          (progn
            (unless (null current-board)
              (push (make-array '(5 5) :initial-contents current-board) boards)
              (setf current-board nil)))
          (setf current-board
                (append current-board
                        (list (mapcar #'parse-integer split-line))))))))

(defun winning-board (board)
  (dotimes (r 5)
    ))

(defun part-1 ()
  (destructuring-bind (instructions boards)
      (load-input "inputs/day4.txt")
    (let ((mark-boards (make-array `(,(length boards) 5 5))))
      (labels ((board (num)
                 (aref boards num))
               (is-marked (board col row)
                 (aref mark-boards board col row))
               (mark (board col row)
                 (setf (aref mark-boards board row col) t))
               (board-ref (board row col)
                 (aref boards board row col)))))))

(defun part-2 ())
