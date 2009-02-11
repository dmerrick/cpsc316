(define my-append
  (lambda (first second)
    (if (null? first)
      second
      (cons (car first) (my-append (cdr first) second)))))

(display (my-append (list 1 2 3) (list 4 5 6)))
(newline)
(display (my-append '(a) `(b c d)))
(newline)
(display (my-append '(1) (list 2 3 4)))
(newline)
(display (my-append (list 'a) '(b)))
(newline)
(display (my-append (list 1 2 3) '(4)))
(newline)
