(define my-reverse
  (lambda (l)
    (cond
      ((null? l) null)
      (else (append (my-reverse (cdr l)) (list (car l)))))))

(display (my-reverse '(a b a c a d)))
(newline)
(display (my-reverse '(a a a a a b)))
(newline)
(display (my-reverse '(banana apple carrot)))
(newline)
(display (my-reverse '(dana a b c d e f dana)))
(newline)
(display (my-reverse '(115 316 215 316 315 316 400)))
(newline)

