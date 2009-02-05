(define my-sum
  (lambda (l)
    (if (null? l)
      0
      (+ (car l)
         (my-sum (cdr l))))))

(display (my-sum '(2 4 6 8)))
(newline)
(display (my-sum '(1 2 3 4)))
(newline)
(display (my-sum '(0 100 1000 10 1)))
(newline)
(display (my-sum '(60 40 30 70)))
(newline)
(display (my-sum '(0 0 0 0 0 0 0 0)))
(newline)
