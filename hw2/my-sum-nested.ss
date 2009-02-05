; this my-sum should work for nested lists
(define my-sum
  (lambda (l)
    (if (null? l)
      0
      (+ (if (list? (car l))
           (my-sum (car l))
           (car l))
         (my-sum (cdr l))))))

(display (my-sum '((1 3 5) (7) 9)))
(newline)
(display (my-sum '(1 (2 (3 (4 5))))))
(newline)
(display (my-sum '(10 20 (30) (40 50))))
(newline)
(display (my-sum '((((((100))))) 1)))
(newline)
(display (my-sum '((2 4) (4 3 (7 (6))))))
(newline)
