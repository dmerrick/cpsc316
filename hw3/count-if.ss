(define count-if
  (lambda (a l)
    (if (null? l)
      0
      (if (equal? a (car l))
        (+ 1 (count-if a (cdr l)))
        (count-if a (cdr l))))))

(display (count-if 'a '(a b a c a d)))
(newline)
(display (count-if 'a '(a a a a a a)))
(newline)
(display (count-if 'banana '(banana apple carrot)))
(newline)
(display (count-if 'dana '(dana a b c d e f dana)))
(newline)
(display (count-if '316 '(115 316 215 316 315 316 400)))
(newline)
