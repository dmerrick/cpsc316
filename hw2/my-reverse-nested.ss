(define my-reverse
  (lambda (l)
    (cond
      ((null? l) null)
      ((list? (car l)) (append (my-reverse (cdr l)) (list (my-reverse (car l)))))
      (else (append (my-reverse (cdr l)) (list (car l)))))))

(display (my-reverse '(a b a (c a) d)))
(newline)
(display (my-reverse '(zebra banana (apple orange) carrot)))
(newline)
(display (my-reverse '(dana (dana (a) b c) (d e f))))
(newline)
(display (my-reverse '(a (b a) c (e () (f)))))
(newline)
(display (my-reverse '(115 (((316 215 316) 315) 215) 400)))
(newline)
