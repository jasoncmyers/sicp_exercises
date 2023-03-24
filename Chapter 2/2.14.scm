; Exercise 2.14.  Demonstrate that Lem is right. Investigate the behavior of the system on a variety of arithmetic expressions. Make some intervals A and B, and use them in computing the expressions A/A and A/B. You will get the most insight by using intervals whose width is a small percentage of the center value. Examine the results of the computation in center-percent form (see exercise 2.12). 

; From text, equivalent rearrangements to calculate parallel resistence:

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
				
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))
								
; utility to view in center, percent format:
(define (cp i)
    (display (center i))
    (display ", ")
    (display (percent i)))				
; Example math:
(cp(div-interval (make-center-percent 10 10) (make-center-percent 10 10)))
; 1.02020202020202, 19.801980198019788
(cp(div-interval (make-center-percent 10 20) (make-center-percent 10 5)))
; 1.012531328320802, 24.752475247524753
(cp(div-interval (make-center-percent 10 25) (make-center-percent 10 25)))
; 1.1333333333333333, 47.05882352941176
(cp(div-interval (make-center-percent 100 20) (make-center-percent 100 5)))
; 1.012531328320802, 24.752475247524742
(cp(div-interval (make-center-percent 100 10) (make-center-percent 100 10)))
; 1.0202020202020203, 19.801980198019816
(cp(div-interval (make-center-percent 100 10) (make-center-percent 10 10)))
; 10.2020202020202, 19.80198019801979
(cp(div-interval (make-center-percent 100 20) (make-center-percent 10 5)))
; 10.125313283208019, 24.75247524752475
(cp(div-interval (make-center-percent 100 5) (make-center-percent 10 20)))
; 10.520833333333332, 24.75247524752475
(cp(div-interval (make-center-percent 100 70) (make-center-percent 100 70)))
; 2.9215686274509807, 93.95973154362417
(cp(div-interval (make-center-percent 100 7) (make-center-percent 100 7)))
; 1.0098482564566376, 13.931734500945373

#| 
The most obvious conclusions are that A/A is not centered on one, but gets further from one the larger the tolerance is.  Likewise A/B is also only an approximation of the ratio of the centers.  In both cases, the resulting tolerance is larger when the input tolerances are larger. This can also be seen in 2.13, where the tx*ty term becomes more significant.
|#
