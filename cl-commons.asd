

(in-package :cl-user)
(defpackage cl-commons-asd
  (:use :cl :asdf))
(in-package :cl-commons-asd)

(defsystem cl-commons
  :author "Sebastian Christ <rudolfo.christ@gmail.com>"
  :license "MIT"
  :version "0.1"
  :components ((:module "src"
                :components
                ((:file "cl-commons"))))
  :description "Personal Common Lisp utilities")
