#|
Exercise 1.39.  A continued fraction representation of the tangent function was published in 1770 by the German mathematician J.H. Lambert:
tan x = x / (1 - x^2 / (3 - x^2 / (5 - ...))))

where x is in radians. Define a procedure (tan-cf x k) that computes an approximation to the tangent function based on Lambert's formula. K specifies the number of terms to compute, as in exercise 1.37. 
|#
; cont-frac from problem 1.37
(define (cont-frac n d k)
  (define (term i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (term (inc i))))))
  (term 1))
  
; define the sequence of parameters
; N = x if i == 1, otherwise -(x^2)
; D = 2i - 1
(define (tan-cf x k)
    (cont-frac
     (lambda (i)
       (if (= i 1)
           x
           (* -1 x x)))
     (lambda (i) (- (* 2 i) 1))
     k))
; Test against built-in tan
(tan (/ 3.141592653589793238 4))
; 0.9999999999999999
(tan-cf (/ 3.141592653589793238 4) 10)
; 1.0
(tan (/ 3.141592653589793238 6))
; 0.5773502691896257
(tan-cf (/ 3.141592653589793238 6) 10)
; 0.5773502691896257
