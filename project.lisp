;;; project.lisp

(in-package :cl-user)
(defpackage #:clutils/project
  (:use :cl)
  (:export
   #:make-project))

(in-package :clutils/project)

(defvar *custom-project-skeleton*
  #.(merge-pathnames "project-skeleton/"
                     (asdf:system-source-directory :clutils)))

(defun  make-project (path
                      &key
                        name
                        description
                        (author "Sebastian Christ")
                        (email "rudolfo.christ@gmail.com")
                        (license "MIT")
                        depends-on
                        (with-coveralls t))
  (let ((cl-project:*skeleton-directory* *custom-project-skeleton*))
    (cl-project:make-project path :name name :description description :author author
                             :email email :license license :depends-on depends-on
                             :with-coveralls with-coveralls)))
