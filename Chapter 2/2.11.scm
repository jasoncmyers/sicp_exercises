; Exercise 2.11.  In passing, Ben also cryptically comments: ``By testing the signs of the endpoints of the intervals, it is possible to break mul-interval into nine cases, only one of which requires more than two multiplications.'' Rewrite this procedure using Ben's suggestion. 

; Logic: 
; There are 3 possible combinations of endpoints that an interval can have: (+,+), (-,-), and (-,+).  Making a combination of two of these gives 9 possible outcomes.
; The only cases that requires more than two multiplications is when both are (-,+), because then the upper and lower bounds could flip signs.  Otherwise, 

(define (ben-mul-interval x y)
    (let (
          (Lx (lower-bound x))
          (Ux (upper-bound x))
          (Ly (lower-bound y))
          (Uy (upper-bound y)))
      (cond ((and
              (>= Lx 0)
              (>= Ux 0)
              (>= Ly 0)
              (>= Uy 0))
             (make-interval (* Lx Ly) (* Ux Uy)))
            ((and
              (< Lx 0)
              (>= Ux 0)
              (>= Ly 0)
              (>= Uy 0))
             (make-interval (* Lx Uy) (* Ux Uy)))
            ((and
              (< Lx 0)
              (< Ux 0)
              (>= Ly 0)
              (>= Uy 0))
             (make-interval (* Lx Uy) (* Ux Ly)))
			 ...
			 
#| This is dumb, so I'm just writing the rest in text:
The above is all x*(+,+)
The general rule is that a negative flips the other number's component L<->U
(e.g. all pos is (Lx*Ly, Ux*Uy), but making the Lx negative -> (Lx*Uy, Ux*Uy)
(+,+)*(-,+): (Ux*Ly, Ux*Uy)
(-,+)*(-,+): <see below>
(-,-)*(-,+): (Lx*Uy, Lx*Ly)
(+,+)*(-,-): (Ux*Ly, Lx*Uy)
(-,+)*(-,-): (Ux*Ly, Lx*Ly)
(-,-)*(-,-): (Lx*Ly, Ux*Uy)

(-,+)*(-,+) is tricky, because the lowest could be either Lx*Uy or Ux*Ly.  
Likewise the highest could be either Lx*Ly or Ux*Uy.  Deal with this by doing all four and using min and max, as in the original implementation.
