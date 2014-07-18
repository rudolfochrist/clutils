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

(defun split-string-in-chars (string)
  "Splits a string in it's charachters."
  (map 'list #'identity string))

(defun string-append (&rest args)
  "Appends strings"
  (apply (partial #'concatenate 'string) args))

(defun average (elements)
  (/ (apply #'+ elements) (length elements)))

(defun string-trim-whitespace (string)
  (string-trim '(#\Space #\Tab #\Newline) string))

(defun string-join (list &key (delimiter " "))
  (string-trim-whitespace (reduce #'(lambda (concatenated current)
               (concatenate 'string concatenated delimiter (princ-to-string current)))
           (cdr list)
           :initial-value (princ-to-string (car list)))))

(defun median (elements)
  "Determines the median of the given elements. Elements MUST be a sorted list."
  (let* ((amount (length elements))
         (index (floor (/ amount 2))))
   (if (evenp amount)
       (average (list (nth  index elements)
                (nth (1- index) elements)))
       (nth index elements))))

(defun generate-random-numbers (bound &key (amount 3))
  "Generates a list of random number. Each number n is int the range 1 <= n < bound. 
:amount specifies how many random numbers should be generated"
  (labels ((recur (current numbers)
             (cond
               ((= (length numbers) amount)
                numbers)
               ((and (<= 1 current) (< current bound))
                (recur (random (1- bound)) (cons current numbers)))
               (t
                (recur (random (1- bound)) numbers)))))
    (recur (random (1- bound)) nil)))

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

