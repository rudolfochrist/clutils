(in-package :cl-user)
(uiop/package:define-package :clutils/all
    (:nicknames :clutils)
  (:use :cl)
  (:use-reexport :clutils/functional
                 :clutils/math
                 :clutils/strings
                 :clutils/macros))
