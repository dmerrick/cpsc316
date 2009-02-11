(define my-apply
  (lambda (f p l)
    (if (equal? l '()) 
      p
      (my-apply f (f p (car l)) (cdr l)))))

(display (my-apply + 1 '(3 5 7 9)))
(newline)
(display (my-apply (lambda (x y) (- x y)) 100 '(1 3 5 7 9)))
(newline)
(display (my-apply cons '() '(1 3 5 7 9)))
(newline)
(display (my-apply - 1 '(2 3 4 5)))
(newline)
(display (my-apply + 100 '(1 3 5 7 9)))
(newline)
