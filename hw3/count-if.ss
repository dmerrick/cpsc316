(define count-if
  (lambda (l ls)
    (if (null? ls)
      0
      (if (l (car ls))
        (+ 1 (count-if l (cdr ls)))
        (count-if l (cdr ls))))))

(display (count-if odd? '(0 1 2 3 4 5 6 7 8 9)))
(newline)
(display (count-if even? '(1 3 5 7 9)))
(newline)
(display (count-if list? '(() () ())))
(newline)
(display (count-if odd? '(1 2 3)))
(newline)
(display (count-if even? '(1 2 3)))
(newline)
