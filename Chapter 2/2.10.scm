; Exercise 2.10.  Ben Bitdiddle, an expert systems programmer, looks over Alyssa's shoulder and comments that it is not clear what it means to divide by an interval that spans zero. Modify Alyssa's code to check for this condition and to signal an error if it occurs.

; Logically, dividing by a span that involves zero means that the result could be either positive or negative, with the range getting further the tighter the span is around zero.
; In our implementation, the problem is that inverting an interval that spans zero inverts sizes, resulting in an upper bound that is lower than the lower bound.

(define (div-interval x y)
    (if (and (<= (lower-bound y) 0)
             (>= (upper-bound y) 0))
        (error "Denominator interval spans zero")
        (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))