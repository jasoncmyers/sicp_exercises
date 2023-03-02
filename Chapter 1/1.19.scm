; Exercise 1.19.   There is a clever algorithm for computing the Fibonacci numbers in a logarithmic number of steps. Recall the transformation of the state variables a and b in the fib-iter process of section 1.2.2: a <- a + b and b <- a. Call this transformation T, and observe that applying T over and over again n times, starting with 1 and 0, produces the pair Fib(n + 1) and Fib(n). In other words, the Fibonacci numbers are produced by applying T^n, the nth power of the transformation T, starting with the pair (1,0). Now consider T to be the special case of p = 0 and q = 1 in a family of transformations Tpq, where Tpq transforms the pair (a,b) according to a <- bq + aq + ap and b <- bp + aq. Show that if we apply such a transformation Tpq twice, the effect is the same as using a single transformation Tp'q' of the same form, and compute p' and q' in terms of p and q. This gives us an explicit way to square these transformations, and thus we can compute T^n using successive squaring, as in the fast-expt procedure. Put this all together to complete the following procedure, which runs in a logarithmic number of steps
; Note, the below function was given in the book except for the compute p' and q' steps

#| Math for the solution:
a' <- bq + aq + ap
b' <- bp + aq
repeat:
a'' <- b'q + a'q + a'p
b'' <- b'p + a'q
substitute:
a'' = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
b'' = (bp + aq)p + (bq + aq + ap)q

b'' = bp' + aq'
= bpp + aqp + bqq + aqq + apq
= b(pp + qq) + a(qq + 2pq)
Thus p' = pp + qq; q' = qq + 2pg

verify:
a'' = bq' + aq' + ap'
= bpq + aqq +bqq + aqq + apq + bpq + apq + app
= b(2pg + qq) + a(2qq + 2pq + pp)
= b(2pg + qq) + a((2pq + qq) + (qq + pp)
= bq' + aq' + ap'
|#

(define (fib n)
    (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     (+ (* p p) (* q q))      ; compute p'
                     (+ (* q q) (* 2 p q))    ; compute q'
                     (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q))
                          p
                          q
                          (- count 1)))))

