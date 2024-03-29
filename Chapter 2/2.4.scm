; Exercise 2.4.  Here is an alternative procedural representation of pairs. For this representation, verify that (car (cons x y)) yields x for any objects x and y.

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))
  
; Solution:
(car (lambda (m) (m x y)))
((lambda (m) (m x y)) (lambda (p q) p))
; -> ((lambda (p q) p) x y) returns x for all x y

; What is the corresponding definition of cdr? (Hint: To verify that this works, make use of the substitution model of section 1.1.5.) 
(define (cdr z)
    (z (lambda (p q) q)))
; Proof follows the same logic to reduce to
((lambda (p q) q) x y)
; which returns y for all x y.
