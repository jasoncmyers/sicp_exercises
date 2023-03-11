#|
Exercise 1.37.  
a. An infinite continued fraction is an expression of the form
f = N1/(D1 + N2/(D2 + N3/D3 + ...))
As an example, one can show that the infinite continued fraction expansion with the Ni and the Di all equal to 1 produces 1/phi, where phi is the golden ratio (described in section 1.2.2). One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms. Such a truncation -- a so-called k-term finite continued fraction -- has the form
N1 / (D1 + N2 / (.... + Nk/Dk))

Suppose that n and d are procedures of one argument (the term index i) that return the Ni and Di of the terms of the continued fraction. Define a procedure cont-frac such that evaluating (cont-frac n d k) computes the value of the k-term finite continued fraction. Check your procedure by approximating 1/phi using

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)

for successive values of k. How large must you make k in order to get an approximation that is accurate to 4 decimal places?

b. If your cont-frac procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process. 
|#
; a.
(define (cont-frac n d k)
  (define (term i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (term (inc i))))))
  (term 1))
; 1/phi = 0.618034; approximate to 4 decimal places
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 5)
; 0.625
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)
; 0.6179775280898876
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 9)
; 0.6181818181818182
; So 10 terms are needed to approximate to 0.6180

; b. Iterative version.  Counts up from the last Nk/Dk term, carrying value at each step.
(define (cont-frac-iter n d k)
    (define (add-prev-result i result)
      (if (= i 0)
          result
          (add-prev-result (dec i) (/ (n i) (+ (d i) result)))))
    (add-prev-result k 0))
; Verify the same results:
(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 9)
; 0.6181818181818182
(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 10)
; 0.6179775280898876
(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 5)
; 0.625
