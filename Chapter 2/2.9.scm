; Exercise 2.9.  The width of an interval is half of the difference between its upper and lower bounds. The width is a measure of the uncertainty of the number specified by the interval. For some arithmetic operations the width of the result of combining two intervals is a function only of the widths of the argument intervals, whereas for others the width of the combination is not a function of the widths of the argument intervals. Show that the width of the sum (or difference) of two intervals is a function only of the widths of the intervals being added (or subtracted). Give examples to show that this is not true for multiplication or division. 
#|
For sum:
width(x+y)) = [U(x+y) - L(x+y)]/2
= [Ux + Uy - (Lx + Ly)]/2
= (Ux - Lx)/2 + (Uy - Ly)/2
= Wx + Wy
Difference:
width(x-y) = [U(x-y) - L(x-y)]/2
= [(Ux-Ly) - (Lx-Uy)]/2
= [Ux - Ly - Lx + Uy]/2
= (Ux + Lx)/2 + (Uy - Ly)/2
= Wx + Wy
Multiplication:
4 possibilities.  If all positive:
(x*y) = (Lx*Ly),(Ux*Uy)
width(x*y) = (Ux*Uy - Lx*Ly)/2

(Ux-Lx)*(Uy-Ly)
UxUy - UxLy - UyLx + LxLy
= Ux*Uy + Lx*Ly - (UxLy  + UyLx)
Is not function of the above.  Nor is it for the other 3 possible width equations.
