; Exercise 2.3.  Implement a representation for rectangles in a plane. (Hint: You may want to make use of exercise 2.2.) In terms of your constructors and selectors, create procedures that compute the perimeter and the area of a given rectangle. Now implement a different representation for rectangles. Can you design your system with suitable abstraction barriers, so that the same perimeter and area procedures will work using either representation?

; Point and line segment functions from 2.2
(define (print-point p)
	(newline)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")"))

(define (make-point x y)
    (cons x y))
(define (x-point p)
    (car p))
(define (y-point p)
    (cdr p))
	
(define (make-segment p1 p2)
    (cons p1 p2))
(define (start-segment seg)
    (car seg))
(define (end-segment seg)
    (cdr seg))
	
; First implement the area and perimeter calculations
; A = w * h; p = 2*w + 2*h
(define (rect-area rect)
    (* (rect-width rect) (rect-height rect)))
(define (rect-perimeter rect)
    (+ (* 2 (rect-width rect)) (* 2 (rect-height rect))))
	
; Then define the rectangle
; ...
; This is a simple concept but the implementation is time consuming and doing all of these is really hampering my motivation to make it through the book.  So here's a sketch of the implmentation without doing the busywork. 
; General approach:
; The rectangle can be defined by two opposite points, or by an origin, width, and height.
; In the first case, the width and height can be calculated from the length of adjacent line segments.  In the second, it is specified directly.
; If we want the rectangles to not be constrained to the coordinate axes, then an angle can also be specified in both implementations, but otherwise doesn't change much.
