; Exercise 1.17.  The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. In a similar way, one can perform integer multiplication by means of repeated addition. The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the expt procedure:

;(define (* a b)
;  (if (= b 0)
;      0
;      (+ a (* a (- b 1)))))

;This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps. 

; First, define the double/halve and other utility functions:
(define (double n)
    (* n 2))
(define (halve n)
    (/ n 2))
(define (even? n)
  (= (remainder n 2) 0))
	
; Then do the analog of the previous question:
; For even b:
;   a = (double a); b = (halve b); state = state
; For odd b:
;   a = a; b = b-1; state = state + a
; At end, b==0, return state (init state to zero)
(define (iter-mult a b state)
    (cond
      ((= b 0) state)
      ((even? b) (iter-mult (double a) (halve b) state))
      (else (iter-mult a (- b 1) (+ state a)))))
	  
; actual function begins with a = 0
(define (fast-mult a b)
    (iter-mult a b 0))