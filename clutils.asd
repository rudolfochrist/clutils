(in-package :cl-user)

#-asdf3.1 (error "Please install ASDF 3.1.2. :asdf-package-system is required.")

(in-package :asdf-user)

(defsystem :clutils
  :author "Sebastian Christ <rudolfo.christ@gmail.com>"
  :license "MIT"
  :version "0.1"
  :description "Personal Common Lisp utilities"
  :class :package-inferred-system
  :defsystem-depends-on (:asdf-package-system)
  :depends-on (:clutils/all
               :split-sequence
               :cl-emb
               :local-time)
  :in-order-to ((test-op (load-op :clutils/test)))
  :perform (test-op (o c) (symbol-call :1am :run)))

(defsystem :clutils/test
  :depends-on (:clutils
               :clutils/test/all))
