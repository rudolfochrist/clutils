(in-package :cl-user)
(defpackage cl-commons
  (:use :cl)
  (:export :split-string-in-chars
           :average
           :median
           :compose
           :partial
           :flip))

(in-package :cl-commons)

(defun split-string-in-chars (string)
  "Splits a string in it's charachters."
  (map 'list #'identity string))

(defun average (elements)
  (/ (apply #'+ elements) (length elements)))

(defun median (elements)
  "Determines the median of the given elements. Elements MUST be a sorted list."
  (let* ((amount (length elements))
         (index (floor (/ amount 2))))
   (if (evenp amount)
       (average (list (nth  index elements)
                (nth (1- index) elements)))
       (nth index elements))))

;;; Functional tools

(defun compose (&rest fns)
  "Composes several functions to one"
  (let ((fn1 (car fns))
        (rest-fns (cdr fns)))
    #'(lambda (&rest args)
        (reduce #'(lambda (value fn)
                    (funcall fn value))
                rest-fns
                :initial-value (apply fn1 args)))))

(defun partial (fn &rest args)
  "Partially applies arguments to a function"
  #'(lambda (&rest more-args)
      (apply fn (append args more-args))))

(defun flip (fn)
  "Reverses the arguments of a function"
  #'(lambda (&rest args)
      (apply fn (reverse args))))
