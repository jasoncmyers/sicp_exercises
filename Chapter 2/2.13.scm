; Exercise 2.13.  Show that under the assumption of small percentage tolerances there is a simple formula for the approximate percentage tolerance of the product of two intervals in terms of the tolerances of the factors. You may simplify the problem by assuming that all numbers are positive. 

#|
(Lx, Ux) * (Ly, Uy) for positive x,y -> (Lx*Ly, Ux*Uy)
cx = (Lx + Ux)/2; tx = (cx - Lx)/cx = 1 - Lx/cx
product: cp = (Lx*Ly + Ux*Uy)/2; tp = 1 - 2*Lx*Ly/(Lx*Ly + Ux*Uy)
or
Lx = cx - tx, Ux = cx + tx, etc.
x*y = (cx - tx*cx)*(cy - ty*cy), (cx+tx*cx)*(cy+ty*cy)
= cx*(1-tx)*cy(1-ty), cx(1+tx)*cy(1+ty)
= cx*cy*(1 - tx - ty + tx*ty), cx*cy(1 + tx + ty + tx*ty)
For small tx, ty
~ cx*cy(1 - tx - ty), cx*cy(1 + tx + ty)
= cxcy - (tx + ty)cxcy), cxcy + (tx + ty)cxcy

So for small tx, ty: c(x*y) = cx*cy; t(x*y) = (tx + ty)
|#
