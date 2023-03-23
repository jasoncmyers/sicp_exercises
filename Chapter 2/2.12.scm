; Exercise 2.12.  Define a constructor make-center-percent that takes a center and a percentage tolerance and produces the desired interval. You must also define a selector percent that produces the percentage tolerance for a given interval. The center selector is the same as the one shown above. 

; Reference from text with center and width:
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
  
; Solution:
; Same as the above, except that width is calculated from percent
(define (make-center-percent c p)
    (let (
          (w (* c (/ p 100.0)))
		  )
      (make-center-width c w)))

; Tests:
(make-center-percent 10 50)
; (mcons 5.0 15.0)
(make-center-percent 25 10)
; (mcons 22.5 27.5)
