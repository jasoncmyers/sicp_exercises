; Exercise 1.46.  Several of the numerical methods described in this chapter are instances of an extremely general computational strategy known as iterative improvement. Iterative improvement says that, to compute something, we start with an initial guess for the answer, test if the guess is good enough, and otherwise improve the guess and continue the process using the improved guess as the new guess. Write a procedure iterative-improve that takes two procedures as arguments: a method for telling whether a guess is good enough and a method for improving a guess. Iterative-improve should return as its value a procedure that takes a guess as argument and keeps improving the guess until it is good enough. Rewrite the sqrt procedure of section 1.1.7 and the fixed-point procedure of section 1.3.3 in terms of iterative-improve. 

; Iterative improvement algorithm
(define (iterative-improve check-guess? improve)
    (define (next-iteration guess)
      (if (check-guess? guess)
          guess
          (next-iteration (improve guess))))
    next-iteration)
	
; Sqrt as function of iterative improve
; Original function from 1.1.7:
#|
; sqrt procedure and sub-procedures from SICP 1.1.7
((define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))
|#
(define (sqrt x)
    ((iterative-improve
      (lambda (guess)
        (< (abs (- (square guess) x)) 0.001))
      (lambda (guess)
        (average guess (/ x guess))))
     1.1))
; Tests:
(sqrt 25)
; 5.000006074534015
(sqrt 121)
; 11.000000000153886

; fixed-point as function of iterative improve
; Original function from 1.3.3
#|
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
|#
(define (fixed-point f first-guess)
    ((iterative-improve
      (lambda (guess)
        (< (abs (- (f guess) guess)) 0.00001))
      (lambda (guess)
        (f guess)))
      first-guess))
; Tests:
(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)
; 1.2587228743052672
(fixed-point cos 1.0)
; 0.7390893414033927
