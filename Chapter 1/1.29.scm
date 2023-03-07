; Exercise 1.29.  Simpson's Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson's Rule, the integral of a function f between a and b is approximated as
;(h/3)(y0+4y1+2y2+4y3+2y4+...+2yn−2+4yn−1+yn), where h=(b−a)/n
; for some even integer n, and yk = f(a + kh). (Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson's Rule. Use your procedure to integrate cube between 0 and 1 (with n = 100 and n = 1000), and compare the results to those of the integral procedure shown above. 

; prerequisite functions
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))	   
(define (inc n) (+ n 1))
(define (cube x) (* x x x))
(define (even? n) (= (remainder n 2) 0))

; Since we need a counter in the form of k, we redefine the sum to run from zero to n instead of a to b like in `integral` from the book.  a and b are used in the value of h and function term, but never need to be incremented.
(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (next-term k)
    (* (f (+ a (* k h)))
       (cond
        ((= k 0) 1)
        ((= k n) 1)
        ((even? k) 2)
        (else 4))))
  (* (/ h 3)
     (sum next-term 0 inc n)))
	 
; Results:
(simpson-integral cube 0 1 1000)
; 1/4