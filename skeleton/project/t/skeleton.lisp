;;; t/<% @var name %>.lisp

(in-package :cl-user)
(defpackage #:<% @var name %>-test
  (:use :cl
        :<% @var name %>)
  (:import-from :fiveam
                #:def-suite
                #:in-suite
                #:run!
                #:is
                #:test)
  (:export #:run))

(in-package :<% @var name %>-test)

(def-suite :<% @var name %>-test
  :description "Test suite for <% @var name %>")
(in-suite :<% @var name %>-test)

(defun run ()
  (5am:run! :<% @var name %>-test))
