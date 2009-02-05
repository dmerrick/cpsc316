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
