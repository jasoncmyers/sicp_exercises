; Exercise 2.18.  Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:

; (reverse (list 1 4 9 16 25))
; (25 16 9 4 1)

; Necessary procedures from text:
(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

(define (length items)
    (define (length-iter a count)
      (if (null? a)
          count
          (length-iter (cdr a) (+ 1 count))))
    (length-iter items 0))
	
; Solution:
(define (reverse items)
    (if (null? items)
        items
        (let ((first (list (car items)))
              (rest (cdr items)))
          (append (reverse rest) first))))
		  
; Tests:
(reverse (list 1 3 5 6 9))
; (9 6 5 3 1)

(reverse (list 1 4 9 16 25))
; (25 16 9 4 1)
