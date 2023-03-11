; Exercise 1.38.  In 1737, the Swiss mathematician Leonhard Euler published a memoir De Fractionibus Continuis, which included a continued fraction expansion for e-2, where e is the base of the natural logarithms. In this fraction, the Ni are all 1, and the Di are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, .... Write a program that uses your cont-frac procedure from exercise 1.37 to approximate e, based on Euler's expansion. 

; cont-frac from problem 1.37
(define (cont-frac n d k)
  (define (term i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (term (inc i))))))
  (term 1))
  
; First, define a formula to produce the 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ... series
; Series gives 1 for every value of (i+1) % 3 != 0
; The other entries are 2->2, 5->4, 8->6, 11->8
; so it increases by 2 every 3 values: (2/3)(i+1)
(define (euler-series i)
    (if (= 0 (remainder (+ i 1) 3))
        (* (/ 2 3) (+ i 1))
        1))
		
; Approximate e as (e-2)+2
(+ 2 (cont-frac (lambda (i) 1.0) euler-series 10))
; 2.7182817182817183
