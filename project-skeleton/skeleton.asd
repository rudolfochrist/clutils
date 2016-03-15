;;; <% @var name %>.asd

(in-package :asdf-user)

(defsystem #:<% @var name %>
  :version "0.1"
  :author "<% @var author %>"
  :mailto "<% @var email %>"
  :license "<% @var license %>"
  :depends-on (<% (format t "~{:~(~A~)~^~%               ~}"
                          (getf env :depends-on)) %>)
  :components ((:module "src"
                        :components
                        ((:file "<% @var name %>"))))
  :description "<% @var description %>"
  :in-order-to ((test-op (load-op :<% @var name %>-test))))
