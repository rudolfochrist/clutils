(in-package :cl-user)

#-asdf3.1 (error "Please install ASDF 3.1.2. :asdf-package-system is required.")

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
