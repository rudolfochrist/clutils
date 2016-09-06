;;; <% @var name %>.lisp

(in-package :cl-user)
(defpackage #:<% @var name %>-test
  (:use :cl
        :fiveam<% (when (member :alexandria (getf env :depends-on))
                        (terpri)
                        (princ "        :alexandria")) %>
        :<% @var name %>))
(in-package :<% @var name %>-test)

(def-suite :<% @var name %>)
(in-suite :<% @var name %>)

;;; tests
(test

 )
