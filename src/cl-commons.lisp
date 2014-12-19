(in-package :cl-user)
(defpackage cl-commons
  (:use :cl)
  (:export :split-string-in-chars
           :string-append
           :string-trim-whitespace
           :string-joins
           :average
           :median
           :generate-random-numbers
           :compose
           :partial
           :flip
           :partial-right))

(in-package :cl-commons)



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

(defun partial (fn &rest partial-args)
  "Partially applies arguments to a function"
  #'(lambda (&rest args)
      (apply fn (append partial-args args))))

(defun flip (fn)
  "Reverses the arguments of a function"
  #'(lambda (&rest args)
      (apply fn (reverse args))))

(defun partial-right (fn &rest partial-args)
  (apply #'partial (flip fn) partial-args))
