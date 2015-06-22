(in-package :cl-user)
(defpackage :clutils/test/lists
  (:use :cl :1am :check-it))

(in-package :clutils/test/lists)

(test zip
  (check-it (generator (list (integer))
                       (list (integer)))
            #'(lambda (list1 list2)
                (let ((zipped (clutils:zip list1 list2)))
                  ))))
