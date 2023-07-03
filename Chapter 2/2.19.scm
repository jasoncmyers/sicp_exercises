#lang sicp
; Exercise 2.19.  Consider the change-counting program of section 1.2.2. It would be nice to be able to easily change the currency used by the program, so that we could compute the number of ways to change a British pound, for example. As the program is written, the knowledge of the currency is distributed partly into the procedure first-denomination and partly into the procedure count-change (which knows that there are five kinds of U.S. coins). It would be nicer to be able to supply a list of coins to be used for making change.

; Define US values used in the original program and UK coins as an alternative
;(define us-coins (list 50 25 10 5 1))
(define us-coins (list 5 25 1 50 10))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

; Base program definition from the problem
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (no-more? items)
    (null? items))
(define (except-first-denomination items)
    (cdr items))
> (define (first-denomination items)
    (car items))

; Tests
(cc 100 us-coins)
292
(cc 100 uk-coins)
104561

; Additional questions
; Does the order of the list coin-values affect the answer produced by cc? Why or why not?
#|
It does not, because the program recursively removes one coin and evaluates every combination after that.
Logically, if we have 10, 5, and 1 cent coins, it doesn't matter if we subtract 5 cents and then look at combinations
of 10 and 1, or subtract 1 and look at combinations of 10 and 5.

This can be verified by testing.
(define shuffle-us-coins (list 5 25 1 50 10))
(cc 100 us-coins)
292
(cc 100 shuffle-us-coins)
292
|#



