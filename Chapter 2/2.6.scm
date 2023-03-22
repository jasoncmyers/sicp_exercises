; Exercise 2.6.  In case representing pairs as procedures wasn't mind-boggling enough, consider that, in a language that can manipulate procedures, we can get by without numbers (at least insofar as nonnegative integers are concerned) by implementing 0 and the operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; This representation is known as Church numerals, after its inventor, Alonzo Church, the logician who invented the calculus.

; Define one and two directly (not in terms of zero and add-1). (Hint: Use substitution to evaluate (add-1 zero)). Give a direct definition of the addition procedure + (not in terms of repeated application of add-1). 

; Solution:
; One is equivalent to (add-1 zero):
(add-1 zero)
(lambda (f) (lambda (x) (f ((zero f) x)))); (zero f) -> (lambda (x) x)
(lambda (f) (lambda (x) (f ((lambda (x) x) x)))); ((lambda (x) x) x) -> (x)
(lambda (f) (lambda (x) (f (x))))

; So zero returns the function it is applied to. one returns the function applied to itself once
(define one
    (lambda (f)
      (lambda (x)
        (f x))))
		
; Test using `inc` as a simple function that will increase once each time applied
((zero inc) 0)
; 0
((zero inc) 5)
; 5
(((add-1 zero) inc) 5)
; 6
(((add-1 zero) inc) 0)
; 1
((one inc) 0)
; 1
((one inc) 3)
; 4

; Likewise, two = (add-1 one)
(add-1 one)
(lambda (f) (lambda (x) (f ((one f) x)))); (one f) -> (lambda (f) (lambda (x) (f x)))
(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x)))); ((lambda (x) (f x)) x) -> (f x)
(lambda (f) (lambda (x) (f (f x))))

(define two
    (lambda (f)
      (lambda (x)
        (f (f x)))))

((two inc) 3)
; 5
((two inc) 0)
; 2

; So addition is applying the function the total number of times from both values
(define (add-church a b)
    (lambda (f)
      (lambda (x)
        ((a f)
          ((b f)
            x)))))
			
; Tests:
(((add-church one two) inc) 0)
; 3
(((add-church two zero) inc) 0)
; 2
(((add-church two zero) inc) 4)
; 6
(define four (add-church two two))
((four inc) 0)
; 4
(((add-church four two) inc) 0)
; 6
