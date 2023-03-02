; The following pattern of numbers is called Pascal's triangle. <img>  The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal's triangle by means of a recursive process. 

(define (pascal row n)
    (cond
      ((= n 1) 1)
      ((= n row) 1)
      (else (+ (pascal (- row 1) (- n 1))
               (pascal (- row 1) n)))))
			   
; version with some error robustness (returns zero for illegal values)
(define (pascal row n)
    (cond
      ((< row 1) 0)
      ((< n 1) 0)
      ((> n row) 0)
      ((= n 1) 1)
      ((= n row) 1)
      (else (+ (pascal (- row 1) (- n 1))
               (pascal (- row 1) n)))))
