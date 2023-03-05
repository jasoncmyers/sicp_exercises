; Exercise 1.23.  The smallest-divisor procedure shown at the start of this section does lots of needless testing: After it checks to see if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. This suggests that the values used for test-divisor should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... To implement this change, define a procedure next that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. Modify the smallest-divisor procedure to use (next test-divisor) instead of (+ test-divisor 1). With timed-prime-test incorporating this modified version of smallest-divisor, run the test for each of the 12 primes found in exercise 1.22. Since this modification halves the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you explain the fact that it is different from 2? 

; Needed utility functions - this is getting ridiculous, I need a better way to do this
(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))
(define (prime? n)
    (= n (smallest-divisor n)))
(define (even? n)
    (= (remainder n 2) 0))
(define (square x) 
    (* x x))
(define (divides? a b)
    (= (remainder b a) 0))
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))
(define (smallest-divisor n)
    (find-divisor n 2))
  
; Begin solution
(define (find-divisor n test-divisor)
    (define (next n)
      (if (= n 2)
          3
          (+ n 2)))
    (cond ((> (square test-divisor) n)
           n)
          ((divides? test-divisor n)
           test-divisor)
          (else
           (find-divisor n (next test-divisor)))))
           
; Results
#|
(search-for-primes 1000 1020)
1001
1003
1005
1007
1009 *** 3
1011
1013 *** 3
1015
1017
1019 *** 4
Complete

(search-for-primes 10000 10050)
10001
10003
10005
10007 *** 9
10009 *** 8
10011
10013
10015
10017
10019
10021
10023
10025
10027
10029
10031
10033
10035
10037 *** 9
10039 *** 8
10041
10043
10045
10047
10049
Complete

(search-for-primes 100000 100050)
100001
100003 *** 22
100005
100007
100009
100011
100013
100015
100017
100019 *** 21
100021
100023
100025
100027
100029
100031
100033
100035
100037
100039
100041
100043 *** 22
100045
100047
100049 *** 22
Complete

; Results again suffer from time resolution issues
; With values ~1000, time drops from 5-6 to 3-4, so somewhere between 0.5x and 0.8x
; The 10,000 trials drop from 12 to 8-9, and 100,000 drops from ~37 to ~22.  
; So in general they drop by less than a factor of 2.  This is probably because checking the divisors is not the only thing that function does, so we haven't actually halved the computational workload.  We have added in some additional overhead for the (next) function call and the additional (if) it contains.  I'm also not sure if having the nested function definition inside the portion that is called recursively has additional negative effects or if that is optimized out.
