; Exercise 2.15.  Eva Lu Ator, another user, has also noticed the different intervals computed by different but algebraically equivalent expressions. She says that a formula to compute with intervals using Alyssa's system will produce tighter error bounds if it can be written in such a form that no variable that represents an uncertain number is repeated. Thus, she says, par2 is a ``better'' program for parallel resistances than par1. Is she right? Why? 

; From text:
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
				
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))
								
; utility to view in center, percent format:
(define (cp i)
    (display (center i))
    (display ", ")
    (display (percent i)))	
; Solution:	
(define A (make-center-percent 100 7))
(define B (make-center-percent 10 7))
(cp (par1 A B))
; 9.269968299211591, 20.72957524391445
(cp (par2 A B))
; 9.09090909090909, 6.999999999999986

; So par2 does produce tighter tolerance.  Is it better?  Based on 2.15, we know that general algebraic principles like A = A*B/B do not hold from interval math:
(cp (div-interval (mul-interval A B) B))
; 101.9696512913275, 20.72957524391443
; Compared to the original A of (100, 7).  So performing this additional step massively expands the tolerance of the values.
