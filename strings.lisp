(in-package :cl-user)
(defpackage :clutils/strings
  (:use :cl
        :clutils/functional)
  (:export :string-trim-whitespace
           :string-append
           :string-join
           :string-split
           :string-starts-with-p
           :string-ends-with-p
           :file-to-strings
           :file-to-string
           :string-to-file))

(in-package :clutils/strings)

(defun string-trim-whitespace (string)
  "Strips whitespace"
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

(defun file-to-strings (filespec)
  "Reads the file, line by line, to strings."
  (with-open-file (stream filespec)
    (loop :for line = (read-line stream nil nil)
       :while line
       :collect line)))

(defun file-to-string (filespec)
  "Reads a file into a string"
  (string-join (file-to-strings filespec)
               :delimiter (princ-to-string #\Newline)))

(defun string-to-file (string filespec &key (format-string "~A"))
  "Writes a string to a file at filespec"
  (with-open-file (stream filespec :direction :output :if-exists :supersede)
    (format stream format-string string)))
