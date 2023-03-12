; Exercise 1.41.  Define a procedure double that takes a procedure of one argument as argument and returns a procedure that applies the original procedure twice. For example, if inc is a procedure that adds 1 to its argument, then (double inc) should be a procedure that adds 2. What value is returned by
; (((double (double double)) inc) 5)

(define (double f)
    (lambda (x)
      (f (f x))))

; Empircally:
(((double (double double)) inc) 5)
; 21
; Explanation: The function (double double) should apply a procedure 4x.  Applying double to that applies (double double) as second time, for 4x4 = 16x
; 5 + 1*16 = 21
