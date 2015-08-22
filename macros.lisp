
(in-package :cl-user)
(defpackage :clutils/macros
  (:use :cl)
  (:export :with
           :xor
           :boolean-equal))

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
The `with' macro is actually a paren-less `let'.
"
  `(let ,(pairs vars)
     ,@body))

(defmacro xor (&rest args)
  "The logical exclusive or."
  (if (null args)
      nil
      (let ((g (gensym)))
        `(let ((,g (xor ,@ (cdr args))))
           (and (or ,(car args) ,g)
                (not (and ,(car args) ,g)))))))

(defmacro boolean-equal (&rest args)
  "Checks for equivalence. Actually this is a negated `xor'."
  `(not (xor ,@args)))
