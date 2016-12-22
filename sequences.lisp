;;; sequences.lisp

(in-package :cl-user)
(defpackage #:clutils/sequences
  (:use :cl)
  (:export
   #:nshuffle
   #:shuffle))

(in-package :clutils/sequences)

(defun nshuffle (sequence)
  "Shuffles the SEQUENCE randomly and in-place.

Uses the Fischer-Yates algorithm for this."
  (loop for i from (1- (length sequence)) downto 1
        for j = (random (1+ i))
        do (rotatef (elt sequence i)
                    (elt sequence j))
        finally (return sequence)))


(defun shuffle (sequence)
  "Shuffles the SEQUENCE randomly."
  (nshuffle (copy-seq sequence)))
