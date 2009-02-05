(define my-expand
  (lambda (l)
    (cond
      ((null? l) null)
      ((list? (car l)) (append (my-expand (car l)) (my-expand (cdr l))))
      (else (cons (car l) (my-expand (cdr l)))))))

(display (my-expand '(a (b) (c (d)))))
(newline)
(display (my-expand '((((a)) (b c) () d))))
(newline)
(display (my-expand '(dana (dana (a) b c) (d e f))))
(newline)
(display (my-expand '(a (b a) c (e () (f)))))
(newline)
(display (my-expand '(115 (((316 215 316) 315) 215) 400)))
(newline)
