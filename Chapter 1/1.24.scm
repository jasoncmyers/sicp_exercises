; Exercise 1.24.  Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime? (the Fermat method), and test each of the 12 primes you found in that exercise. Since the Fermat test has (log n) growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you find? 

; Needed utility functions
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
; Fast prime functions
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
; Code from 1.22
(define (search-for-primes start-number end-number)
    ; Inspired by problem 1.23, modified to avoid checking for any even numbers
    (cond
        ((> start-number end-number)
            (display "\nComplete"))
        ((even? start-number)
            (search-for-primes (+ start-number 1) end-number))
        (else
            (timed-prime-test start-number)
            (search-for-primes (+ start-number 2) end-number))))
	
; Begin solution
(define (start-prime-test n start-time)
    (if (fast-prime? n 10) ; Use ten iterations of Fermat test
        (report-prime (- (runtime) start-time))))

; Results:
#|
(search-for-primes 1000 1020)
1001
1003
1005
1007
1009 *** 27
1011
1013 *** 26
1015
1017
1019 *** 27
Complete

(search-for-primes 10000 10050)
10001
10003
10005
10007 *** 31
10009 *** 32
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
10037 *** 33
10039 *** 36
10041
10043
10045
10047
10049
Complete

(search-for-primes 100000 100050)
100001
100003 *** 36
100005
100007
100009
100011
100013
100015
100017
100019 *** 39
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
100043 *** 39
100045
100047
100049 *** 42
Complete

; Each factor of ten growth in the size of n results in a constant time increase of 5-8 ms, which is consistent with a O(log n) scaling.