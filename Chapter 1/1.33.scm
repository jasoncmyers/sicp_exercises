; Exercise 1.33.  You can obtain an even more general version of accumulate (exercise 1.32) by introducing the notion of a filter on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write filtered-accumulate as a procedure. Show how to express the following using filtered-accumulate:

; a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)

; b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1). 

(define (filtered-accumulate combiner null-value term a next b predicate?)
  (if (> a b)
      null-value
      (combiner
       (if (predicate? a)
           (term a)
           null-value)
       (filtered-accumulate combiner null-value term (next a) next b predicate?))))
	   
; a. sum of squares of primes
(define (sum-squares-prime a b)
    (filtered-accumulate + 0 square a inc b prime?))
	
; b. product of pos. int. i < n s.t. GCD(i,n) = 1; assumes GCD & identity functions already exist (as defined in previous problems).
(define (product-rel-prime n)
    (define (rel-prime? i)
      (= (gcd i n) 1))
    (filtered-accumulate * 1 identity 1 inc n rel-prime?))
