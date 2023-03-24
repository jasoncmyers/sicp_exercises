; Exercise 2.16.  Explain, in general, why equivalent algebraic expressions may lead to different answers. Can you devise an interval-arithmetic package that does not have this shortcoming, or is this task impossible? (Warning: This problem is very difficult.) 

#|
In general, if an algebraic operation increases the average tolerance of the intervals it is performed on, then the inverse operation will *also* increase the tolerance.  
We see this with addition/subtraction in 2.9, where both addition and subtract yield the sums of their widths:
So A + B - B has width = wA + wB + wB = wA + 2*wB
Likewise, from 2.14, 2.15, we know that A*B/B also increases the width

(define A (make-center-percent 100 7))
(define B (make-center-percent 10 7))
(cw A)
100.0, 7.0
(cw B)
10.0, 0.6999999999999993

(cw (sub-interval (add-interval A B) B))
100.0, 8.400000000000006
(cw (div-interval (mul-interval A B) B))
101.9696512913275, 21.137875590392902

So by repeated operations that are equivalent in normal algebra, we can make the tolerance arbitrarily large.


So can we avoid this?
Probably not.  To some extent, this *is* correct.  If we take a precisely massed pile and alternate throwing an estimated 10 g, then adding an estimated 10 g repeatedly, at the end we are much less sure of the pile size than when we started.  And this gets worse the longer we go on.  So to some extent the problem is with trying to apply algebraic identities to uncertain values.

So even using a statistical algebra instead of the lowest/highest possible outcomes, we still will either have this problem, or the algebra will be a poor approximation of reality.

As noted in 2.15, reducing the number of appearances of each variable reduces this purely algebraic uncertainty, but there are certainly instances (e.g. polynomials) where it is impossible to avoid repeating values.

It may be possible to construct a reference table of each application of a variable and try to "undo" the repetation, but even this may be impossible.  In, for example, a situation where only A is repeated, once interacting with an interval of comparable tolerance and once with an interval of much larger tolerance, which is the correct effect to undo?
|#
