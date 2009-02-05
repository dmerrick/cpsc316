(define my-count
  (lambda (a l)
    (if (null? l)
      0
      (if (equal? a (car l))
        (+ 1 (my-count a (cdr l)))
        (my-count a (cdr l))))))

(display (my-count 'a '(a b a c a d)))
(newline)
(display (my-count 'a '(a a a a a a)))
(newline)
(display (my-count 'banana '(banana apple carrot)))
(newline)
(display (my-count 'dana '(dana a b c d e f dana)))
(newline)
(display (my-count '316 '(115 316 215 316 315 316 400)))
(newline)
