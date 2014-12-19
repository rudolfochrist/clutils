(in-package :cl-user)
(defpackage :clutils/strings
  (:use :cl
        :clutils/functional)
  (:export :string-trim-whitespace
           :string-append
           :string-join))

(in-package :clutils/strings)

(defun string-trim-whitespace (string)
  "Strips white"
  (string-trim '(#\Space #\Tab #\Newline) string))

(defun string-append (&rest args)
  "Appends strings"
  (apply (partial #'concatenate 'string) args))

(defun string-join (list &key (delimiter " "))
  "Joins a list of strings together"
  (string-trim-whitespace (reduce #'(lambda (concatenated current)
               (concatenate 'string concatenated delimiter (princ-to-string current)))
           (cdr list)
           :initial-value (princ-to-string (car list)))))

(defun string-split (string &key seperator)
  "Splits a string by provided seperator. If no seperator has been given the string is split into his characters."
  (let ((string-in-chars (map 'list #'identity string)))
    (if seperator
        (nreverse (mapcar (compose #'string-join #'nreverse)
                 (reduce #'(lambda (result item)
                             (if (equal item seperator)
                                 (cons nil result)
                                 (cons (cons item (car result)) (cdr result))))
                         string-in-chars :initial-value '())))
        string-in-chars)))

(defun string-starts-with-p (string prefix)
  "Tests if string has given prefix."
  (when (< (length prefix) (length string))
    (equal prefix (subseq string 0 (length prefix)))))

(defun string-ends-with-p (string suffix)
  "Tests if string has given suffix"
  (string-starts-with-p (reverse string) (reverse suffix)))
