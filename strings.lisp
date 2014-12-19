(in-package :cl-user)
(defpackage :clutils/strings
  (:use :cl
        :clutils/functional)
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

(defun string-split (string &key seperator)
  (let ((string-in-chars (map 'list #'identity string)))
    (if seperator
        (nreverse (mapcar (compose #'string-join #'nreverse)
                 (reduce #'(lambda (result item)
                             (if (equal item seperator)
                                 (cons nil result)
                                 (cons (cons item (car result)) (cdr result))))
                         string-in-chars :initial-value '())))
        string-in-chars)))
