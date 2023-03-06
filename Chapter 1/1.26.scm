; Exercise 1.26.  Louis Reasoner is having great difficulty doing exercise 1.24. His fast-prime? test seems to run more slowly than his prime? test. Louis calls his friend Eva Lu Ator over to help. When they examine Louis's code, they find that he has rewritten the expmod procedure to use an explicit multiplication, rather than calling square:

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;``I don't see what difference that could make,'' says Louis. ``I do.'' says Eva. ``By writing the procedure like that, you have transformed the (log n) process into a (n) process.'' Explain. 

#|
The explanation is that the program is evaluated in applicative order, so everything is expanded first and then evaluated.  
This means that each instance of expmod is being evaluated twice.  In contrast, when square is defined, its argument is fully evaluated before square is applied, so expmod is only run once.
This converts it from O(log n) to O(n) because each call is a recursive call to the full procedure, each of which also now has twice as many calls.  So the time is increased by 2 for each iteration, giving 2^n scaling inside the original log complexity:
O(log 2^n) = O(n log 2) = O(n)
