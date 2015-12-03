(in-package :cl-user)

(defpackage   #:clutils/packages
  (:use       :cl)
  (:export
   #:add-nickname))

(in-package :clutils/packages)

(defun add-nickname (package nickname)
  (when (stringp package)
    (setf package (find-package package)))
  (when (symbolp nickname)
    (setf nickname (symbol-name nickname)))
  (rename-package package (package-name package)
                  (adjoin nickname (package-nicknames package) :test #'string=)))
