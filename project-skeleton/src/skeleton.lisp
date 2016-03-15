;;; <% @var name %>.lisp

(in-package :cl-user)
(defpackage #:<% @var name %>
            (:use :cl<%(when (member :alexandria (getf env :depends-on))
                         (princ " :alexandria")) %>))
(in-package :<% @var name %>)

;;; blah blah blag
