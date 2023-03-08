; Exercise 1.31.  
; a.  The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures. Write an analogous procedure called product that returns the product of the values of a function at points over a given range. Show how to define factorial in terms of product. Also use product to compute approximations to using the formula (pi/4) = (2*4*4*6*6*8*...)/(3*3*5*5*7*7*...)

; b.  If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process. 

(define (product term  a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
; Tests:
(define (identity x) x)
(product identity 1 inc 5)
; 120
(product identity 0 inc 15)
; 0

; Factorial:
(define (factorial n)
  (product identity 1 inc n))
; Tests:
(factorial 3)
; 6
(factorial 12)
; 479001600

; Pi approximation:
(define (pi-approx terms)
  (define (top-term k)
    (+ k 2 (remainder k 2)))
  (define (bottom-term k)
    (+ k 1 (remainder k 2)))
  ; Top term starts at k=0, bottom at k=1
  (* 4.0 (/
        (product top-term 0 inc terms)
        (product bottom-term 1 inc (+ terms 1)))))
; Tests:
(pi-approx 15.0)
;3.2300364664117174
(pi-approx 1015)
;3.1431360542702396
		
; Iterative process for product
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
; Tests:
(product-iter identity 1 inc 5)
;120
(product-iter identity 1 inc 15)
;1307674368000
