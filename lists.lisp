(in-package :cl-user)
(defpackage :clutils/lists
  (:use :cl)
  (:export :zip))

(in-package :clutils/lists)

(defun zip (&rest lists)
  "Zip lists.
Example:
(zip '(1 2 3) '(4 5 6))  ;=> ((1 4) (2 5) (3 6))
"
  (apply  #'mapcar #'list lists))
