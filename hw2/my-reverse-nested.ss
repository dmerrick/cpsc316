(define my-reverse
  (lambda (l)
    (cond
      ((null? l) null)
      ((list? (car l)) (append (my-reverse (cdr l)) (list (my-reverse (car l)))))
      (else (append (my-reverse (cdr l)) (list (car l)))))))

(display (my-reverse '(a b a (c a) d)))
(newline)


