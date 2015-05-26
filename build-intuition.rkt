#lang racket
(require racket/control)
;(reset 1)
;(shift k 1)
;(shift k (k 1))
;(+ 1 (reset 10))
;(+ 1 (shift k 10))
;(+ 1 (shift k (k 10)))
;(+ 1 (shift k (k (k 10))))
;(+ 1 (reset (+ 10 (shift k 100))))


(define (foldl f xs acc)
    (if (= (length xs) 0)
        acc
        (foldl f (cdr xs) (f acc (car xs)))))
(define (break ans) (shift k ans))
(define (acc-loop f xs z) (reset (foldl f xs z)))
(define (all xs)
    (acc-loop
     (lambda (acc x) (if x #t (break #f)))
     xs
     #t))

