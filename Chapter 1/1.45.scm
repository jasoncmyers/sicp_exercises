; Exercise 1.45.  We saw in section 1.3.3 that attempting to compute square roots by naively finding a fixed point of y x/y does not converge, and that this can be fixed by average damping. The same method works for finding cube roots as fixed points of the average-damped y x/y2. Unfortunately, the process does not work for fourth roots -- a single average damp is not enough to make a fixed-point search for y x/y3 converge. On the other hand, if we average damp twice (i.e., use the average damp of the average damp of y x/y3) the fixed-point search does converge. Do some experiments to determine how many average damps are required to compute nth roots as a fixed-point search based upon repeated average damping of y x/yn-1. Use this to implement a simple procedure for computing nth roots using fixed-point, average-damp, and the repeated procedure of exercise 1.43. Assume that any arithmetic operations you need are available as primitives. 

; define a procedure to rainse to nth power
(define (n-power x n)
    (if (= n 0)
        1
        (* x (power x (dec n)))))
		
; undamped nth-root.  Fails unless the guess is almost exact (presumably from oscillation)
(define (n-root x n)
    (fixed-point (lambda (y) (/ x (power y (dec n)))) 7))
	
; Multiple damped version
(define (damped-n-root x n damp-level)
    (fixed-point
     ((repeated average-damp damp-level)
      (lambda (y) (/ x (power y (dec n)))))
     1.1))
	 
; Tests:
(damped-n-root 64 2 2)
; 8.000006904772114
(damped-n-root 64 3 2)
; 4.0000026395560155
(damped-n-root 64 8 2)
; hangs
(damped-n-root 64 8 3)
; 1.6817928305074292
(damped-n-root 65536 8 3)
; 4.000000000084815
(damped-n-root 65536 16 3)
; hangs
(damped-n-root 65536 16 4)
; 2.0000000000083182
; Looks like ~log2 of the root damping is needed
