(in-package :cl-user)
(defpackage :clutils/strings
  (:use :cl)
  (:export :string-trim-whitespace
           :string-append
           :string-join))

(in-package :clutils/strings)

(defun string-trim-whitespace (string)
  (string-trim '(#\Space #\Tab #\Newline) string))

(defun string-append (&rest args)
  "Appends strings"
  (apply (partial #'concatenate 'string) args))

(defun string-join (list &key (delimiter " "))
  (string-trim-whitespace (reduce #'(lambda (concatenated current)
               (concatenate 'string concatenated delimiter (princ-to-string current)))
           (cdr list)
           :initial-value (princ-to-string (car list)))))
