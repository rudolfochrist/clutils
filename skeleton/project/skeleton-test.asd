;;; <% @var name %>-test.asd

(in-package :asdf-user)

(defsystem #:<% @var name %>-test
  :author "<% @var author %>"
  :mailto "<% @var email %>"
  :description "Test system of <% @var name %>"
  :license "<% @var license %>"
  :depends-on (:fiveam
               :<% @var name %>)
  :components ((:module "t"
                :components ((:file "<% @var name %>"))))
  :perform (test-op (op c)
                    (asdf:clear-system c)
                    (uiop:symbol-call :<% @var name %>-test :run)))
