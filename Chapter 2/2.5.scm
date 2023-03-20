; Exercise 2.5.  Show that we can represent pairs of nonnegative integers using only numbers and arithmetic operations if we represent the pair a and b as the integer that is the product 2^a 3^b. Give the corresponding definitions of the procedures cons, car, and cdr. 

;2 and 3 are both prime, so they have no common factors.  So any 2^a*3^b will be a unique representation.
; Definitions
(define (cons x y)
    (* (power 2 a) (power 3 b)))
; To extract the separate parts again, we need to divide the values by 2 or 3 in a loop for as long as the division has no remainder.  (Note that this isn't the same as taking a based logarithm, because we need to safely ignore the other factor. E.g., 72 divides by 2 evenly 3 times, leaving a remainder of 9.  But log2 of 24 is ~6.17)
(define (car x)
    (define (div-by-two a n)
      (if (= 0 (remainder a 2))
          (div-by-two (/ a 2) (inc n))
          n))
    (div-by-two x 0))

(define (cdr x)
    (define (div-by-three a n)
      (if (= 0 (remainder a 3))
          (div-by-three (/ a 3) (inc n))
          n))
    (div-by-three x 0))
