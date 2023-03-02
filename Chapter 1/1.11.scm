;Exercise 1.11.  A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

; Recursive:
(define (f n)
    (if (< n 3)
        n
        (+ (f (- n 1))
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3))))))
		   
; Iterative
(define (f-iter f-1 f-2 f-3 count n)
    (if (= count n)
        f-1
        (f-iter (+ f-1 (* 2 f-2) (* 3 f-3)) f-1 f-2 (inc count) n)))
		
 (define (f n)
    (if (< n 3)
        n
        (f-iter 2 1 0 2 n)))