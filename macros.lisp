
(in-package :cl-user)
(defpackage :clutils/macros
  (:use :cl)
  (:export :with))

(in-package :clutils/macros)

(defun pairs (lst)
  "Creates a list of pairs with the elements of `lst'"
  (labels ((recu (cur acc)
             (if (null cur)
                 acc
                 (recu (cddr cur)
                       (cons (list (first cur)
                                              (second cur))
                                        acc)))))
    (nreverse (recu lst '()))))

(defmacro with (vars &body body)
  "Binds values to names.
Example:
(with (a 1
       b 2)
 (+ a b))
;=> 3

The `with' macro is actually a paren-less `let'.
"
  `(let ,(pairs vars)
     ,@body))
