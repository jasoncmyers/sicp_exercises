; Exercise 1.34.  Suppose we define the procedure

(define (f g)
  (g 2))

; Then we have

(f square)
4

(f (lambda (z) (* z (+ z 1))))
6

; What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain. 

; Since we have applicative order expansion, each statement is expanded as needed, so
(f f)
; becomes
(f 2)
; becomes
(2 2)
; and then fails because "2" isn't a procedure