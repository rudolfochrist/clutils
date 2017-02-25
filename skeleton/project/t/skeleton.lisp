;;; t/<% @var name %>.lisp

(in-package :cl-user)
(defpackage #:<% @var name %>-test
  (:use :cl
        :fiveam
        :<% @var name %>)
  (:export #:run))

(in-package :<% @var name %>-test)

(def-suite :<% @var name %>-test
  :description "Test suite for <% @var name %>")
(in-suite :<% @var name %>-test)

(defun run ()
  (5am:run! :<% @var name %>-test))
