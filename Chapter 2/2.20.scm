#lang sicp

#| Exercise 2.20.  The procedures +, *, and list take arbitrary numbers of arguments. One way to define such procedures is to use define with dotted-tail notation. In a procedure definition, a parameter list that has a dot before the last parameter name indicates that, when the procedure is called, the initial parameters (if any) will have as values the initial arguments, as usual, but the final parameter's value will be a list of any remaining arguments. For instance, given the definition

(define (f x y . z) <body>)

the procedure f can be called with two or more arguments. If we evaluate

(f 1 2 3 4 5 6)

then in the body of f, x will be 1, y will be 2, and z will be the list (3 4 5 6). Given the definition

(define (g . w) <body>)

the procedure g can be called with zero or more arguments. If we evaluate

(g 1 2 3 4 5 6)

then in the body of g, w will be the list (1 2 3 4 5 6).11

Use this notation to write a procedure same-parity that takes one or more integers and returns a list of all the arguments that have the same even-odd parity as the first argument. For example,

(same-parity 1 2 3 4 5 6 7)
(1 3 5 7)

(same-parity 2 3 4 5 6 7)
(2 4 6)
|#

(define (same-parity base . items)
    ; check if a and b are both odd or both even
    (define (compare-parity a b)
      (= (remainder a 2) (remainder b 2)))
    ; main function: uses base (first item) from outer function, then recursively calls itself and tracks an
    ; answer list, adding the next item iff it matches the base parity.
    (define (parity-list items same-list)
      (if (null? items)
          same-list
          (parity-list (cdr items)
                       (if (compare-parity base (car items))
                           (append same-list (list (car items)))
                           same-list))))
    (parity-list items (list base)))

; Tests
(display (same-parity 1 2 3 4 5 6 7))
(1 3 5 7)
(display (same-parity 1 2 3 4 5 6 7 8 9 9))
(1 3 5 7 9 9)
(display (same-parity 2 3 4 5 6 7 8 9 9))
(2 4 6 8)
(display (same-parity 8 2 3 4 5 6 7 8 9 9))
(8 2 4 6 8)
