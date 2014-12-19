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
