; Exercise 2.17.  Define a procedure last-pair that returns the list that contains only the last element of a given (nonempty) list:

; (last-pair (list 23 72 149 34))
; (34)

(define (last-pair _list)
    (if (null? (cdr _list))
        _list
        (last-pair (cdr _list))))
		
; Tests:
(last-pair (list 1 3 5 7 9))
; (9)
(last-pair (list 1 3 5 (list 7 9)))
; ((7 9))
