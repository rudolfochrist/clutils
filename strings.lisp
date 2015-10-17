(in-package :cl-user)
(defpackage :clutils/strings
  (:use :cl
        :clutils/functional)
  (:import-from :split-sequence
                :split-sequence)
  (:export :string-trim-whitespace
           :string-append
           :string-join
           :string-split
           :string-split-whitespace
           :string-starts-with-p
           :string-ends-with-p
           :file-to-strings
           :file-to-string
           :string-to-file
           :with-file-to-string))

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

(defun string-split (string)
  "Splits a string into it's characters."
  (map 'list #'identity string))

(defun string-split-whitespace (string)
  "Splits a string on whitespace."
  (split-sequence #\Space string :test #'char-equal :remove-empty-subseqs t))

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
  "Writes a string to a file at filespec. Supersedes if exists."
  (with-open-file (stream filespec :direction :output :if-exists :supersede)
    (format stream format-string string)))

(defmacro with-file-to-string ((var filespec) &body body)
  "Binds the contents of the file under FILESPEC to VAR."
  `(let ((,var (file-to-string ,filespec)))
     ,@body))
