; Exercise 2.8.  Using reasoning analogous to Alyssa's, describe how the difference of two intervals may be computed. Define a corresponding subtraction procedure, called sub-interval. 

; The smallest possible subtraction value is low(a) - high(b) and highest is high(a) - low(b)
(define (sub-interval x y)
    (make-interval
     (- (lower-bound x) (upper-bound y))
     (- (upper-bound x) (lower-bound y))))
