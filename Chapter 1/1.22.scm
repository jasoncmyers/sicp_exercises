; Exercise 1.22.  Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.

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

; Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime. Since the testing algorithm has order of growth of (n), you should expect that testing for primes around 10,000 should take about 10 times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the n prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation? 

; Additional definitions needed here
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
	
; Begin solution here
; I went with an end range instead of number to find because I couldn't think of a way to do the latter without rewriting the given functions to return a boolean result as well as print the time.
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
			
#| Results - The first three primes in each range could be found with:
(search-for-primes 1000 1020)
Output: 
1001
1003
1005
1007
1009 *** 6
1011
1013 *** 5
1015
1017
1019 *** 5
Complete

(search-for-primes 10000 10050)
10001
10003
10005
10007 *** 12
10009 *** 12
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
10037 *** 12
10039 *** 12
10041
10043
10045
10047
10049
Complete

(search-for-primes 100000 100050)
100001
100003 *** 38
100005
100007
100009
100011
100013
100015
100017
100019 *** 32
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
100043 *** 37
100045
100047
100049 *** 37
Complete
|#

; Time resolution is very low, and the numbers don't exactly work out
; Going from 1000 -> 10,000 takes ~2x as long
; 10,000 -> 100,000 takes ~3x as long.  
; Sqrt(10) is 3.16, so this in the ballpark but not particularly convincing.