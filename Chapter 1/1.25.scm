; Exercise 1.25.  Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod. After all, she says, since we already know how to compute exponentials, we could have simply written

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; Is she correct? Would this procedure serve as well for our fast prime tester? Explain. 

; Comparing the implemented version
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))        

; with the above, we see the main problem is that her expmod version calculates arbitrarily large intermediate values (which are likely to be extremely large in the cases used in this chapter).  
; This means that the memory requirements for the intermediate storage are much larger, and the remainder division will also take much more time, since it has a vastly larger input.  This also has possible issues of running into upper limits of system storage or value representation.