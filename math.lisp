(in-package :cl-user)
(defpackage :clutils/math
  (:use :cl)
  (:use :average
        :median
        :generate-random-numbers
        :primep))

(in-package :clutils/math)

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

(defun primep (number)
  "Fermat primality test"
  (cond
    ((= number 1) nil)
    ((or (= number 2) (= number 3)) t)
    (t
     (every #'identity
            (mapcar #'(lambda (base)
                        (= 1 (mod (expt base (1- number)) number)))
                    (generate-random-numbers number))))))
