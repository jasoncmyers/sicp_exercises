; Exercise 1.35.  Show that the golden ratio phi (section 1.2.2) is a fixed point of the transformation x -> 1 + 1/x, and use this fact to compute phi by means of the fixed-point procedure. 

#|
x = 1 + 1/x
x^2 = x + 1
x^2 - x - 1 = 0
x = [1 +/- sqrt(1 - 4(1)(-1))] / 2
x = (1 +/- sqrt(5))/2
phi is defined as [1 + sqrt(5)]/2
|#

; Solve for phi via
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
; 1.6180327868852458
