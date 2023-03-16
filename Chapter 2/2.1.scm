; Exercise 2.1.  Define a better version of make-rat that handles both positive and negative arguments. Make-rat should normalize the sign so that if the rational number is positive, both the numerator and denominator are positive, and if the rational number is negative, only the numerator is negative. 

; Original make-rat and other necessary functions
(define (make-rat n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
	  
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
		
(define (print-rat x)
    (display (numer x))
    (display "/")
    (display (denom x)))
	
(define (numer x) (car x))
(define (denom x) (cdr x))
	
; Solution - We never want a negative denominator, so if d < 0, multiply both n and d by -1 to keep the same result and make d positive.
(define (make-rat n d)
    (let ((g (gcd n d))
          (n (if (< d 0)
                 (* -1 n)
                 n))
          (d (if (< d 0)
                 (* -1 d)
                 d)))
      (cons (/ n g) (/ d g))))
	  
; Tests:
(print-rat (make-rat 3 -9))
; -1/3
(print-rat (make-rat -3 9))
; -1/3
(print-rat (make-rat -3 -9))
; 1/3
(print-rat (make-rat 3 9))
; 1/3
