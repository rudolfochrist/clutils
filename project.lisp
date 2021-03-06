;;; project.lisp

(in-package :cl-user)
(defpackage #:clutils/project
  (:use :cl)
  (:import-from :cl-project)
  (:export
   #:make-project))

(in-package :clutils/project)

(defvar *custom-project-skeleton*
  (asdf:system-relative-pathname :clutils "skeleton/")) 

(defun  make-project (path
                      &key
                        name
                        description
                        (author "Sebastian Christ")
                        (email "rudolfo.christ@gmail.com")
                        (license "MIT")
                        depends-on
                        (with-coveralls t)
                        (with-source-control t))
  (let ((dir-path (uiop:ensure-directory-pathname path)))
    (let ((cl-project:*skeleton-directory* (merge-pathnames "project/"
                                                            *custom-project-skeleton*)))
      (loop
        (restart-case (if (probe-file dir-path)
                          (error "Path ~S already exists!" dir-path)
                          (return))
          (overwrite ()
            :report "Use dir-path anyway and overwrite existing files."
            (return))
          (new-path (new-path)
            :report "Use a different path."
            :interactive (lambda ()
                           (princ "Path> " *query-io*)
                           (list (read *query-io*)))
            (setf dir-path (uiop:ensure-directory-pathname new-path)))))
      (cl-project:make-project dir-path
                               :name name
                               :description description
                               :author author
                               :email email
                               :license license
                               :depends-on depends-on
                               :with-coveralls with-coveralls
                               :with-source-control with-source-control))
    ;; add license file
    (let ((template-path (merge-pathnames (format nil "licenses/~A.license" (string-downcase license))
                                          *custom-project-skeleton*))
          (project-name (or name
                            (first (last (pathname-directory dir-path))))))
      (with-open-file (license-file (merge-pathnames #p"LICENSE" dir-path) :direction :output :if-exists :supersede)
        (format t "writing ~A" (namestring license-file))
        (format license-file "~A"
                (cl-emb:execute-emb template-path
                                    :env (list :name project-name
                                               :description description
                                               :author author))))))
  :OK)
