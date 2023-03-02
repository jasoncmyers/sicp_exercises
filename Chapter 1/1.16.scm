; Exercise 1.16.  Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. (Hint: Using the observation that (b^n/2)^2 = (b^2)^n/2, keep, along with the exponent n and the base b, an additional state variable a, and define the state transformation in such a way that the product a*b^n is unchanged from state to state. At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process. In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.) 

; Necessary utility functions:
(define (even? n)
	= (remainder n 2) 0))
(define (square x) 
	(* x x))

; a*b^n -> 1 * b^n = b * b^(n-1) = b^2 * b^(n-2) ...
; (b^n/2)^2 = (b^2)^n/2)
; per step: b = b^2; n = n/2; a = a?
; if odd: b^n = b*b^n-1
;   per step: b = b; n=n-1; a=a*b*b^n-1
; At end: n reduces to one, and b == original b^n (for evens) and a == 1 or "odd-b".  
; This then sets n to zero and a = a*b, which gives final b^n result

(define (expt-iter b n a)
    (cond
      ((= n 0) a)
      ((even? n) (expt-iter (square b) (/ n 2) a))
      (else (expt-iter b (- n 1) (* a b)))))

; actual function call starts with a init to 1
(define (fast-expt b n)
	(expt-iter b n 1))