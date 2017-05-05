(in-package :cl-user)
(uiop/package:define-package :clutils/all
    (:nicknames :clutils :clu)
  (:use :cl)
  (:use-reexport
   :clutils/functional
   :clutils/math
   :clutils/strings
   :clutils/macros
   :clutils/lists
   :clutils/sequences
   :clutils/packages
   :clutils/project))
