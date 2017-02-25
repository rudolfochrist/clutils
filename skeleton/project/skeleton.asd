;;; <% @var name %>.asd

(in-package :asdf-user)

(defsystem #:<% @var name %>
  :version "0.1.0"
  :author "<% @var author %>"
  :mailto "<% @var email %>"
  :license "<% @var license %>"<% @if homepage %>
  :homepage "<% @var homepage %>"<% @endif %><% @if with-source-control %>
  :source-control (:git "git@github.com:rudolfochrist/<% @var name %>.git")
  :bug-tracker "https://github.com/rudolfochrist/<% @var name %>/issues"<% @endif %>
  :depends-on (<% (format t "~{:~(~A~)~^~%               ~}"
                          (getf env :depends-on)) %>)
  :components ((:module "src"
                :components ((:file "package"))))
  :description "<% @var description %>"
  :in-order-to ((test-op (test-op :<% @var name %>-test))))
