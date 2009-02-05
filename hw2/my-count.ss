(define my-count
  (lambda (a l)
    (if (null? l)
      0
      (if (equal? a (car l))
        (+ 1 (my-count a (cdr l)))
        (my-count a (cdr l))))))
(display (my-count 'a '(a b a c a d)))
(newline)