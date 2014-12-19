(in-package :cl-user)
(defpackage :clutils-asd
  (:use :cl :asdf))
(in-package :clutils-asd)

(defsystem :clutils
  :author "Sebastian Christ <rudolfo.christ@gmail.com>"
  :license "MIT"
  :version "0.1"
  :description "Personal Common Lisp utilities"
  :class :package-inferred-system
  :defsystem-depends-on (:asdf-package-system)
  :depends-on (:clutils/all))
