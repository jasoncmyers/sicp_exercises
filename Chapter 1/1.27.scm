; Exercise 1.27.  Demonstrate that the Carmichael numbers listed in footnote 47 really do fool the Fermat test. That is, write a procedure that takes an integer n and tests whether an is congruent to a modulo n for every a<n, and try your procedure on the given Carmichael numbers. 

; Solution. Requires `prime?` from previous problems
(define (Carmichael? n)
    (define (test-combination a n)
      (cond
        ((>= a n)
         (if (prime? n) #f #t))
        ((= (expmod a n n) a)
         (test-combination (+ a 1) n))
        (else #f)))
    (test-combination 1 n))
	
; Results:
#|
(Carmichael? 5)
#f

(Carmichael? 7)
#f

(Carmichael? 561)
#t

(Carmichael? 560)
#f

(Carmichael? 1105)
#t

> (Carmichael? 1107)
#f
|#
