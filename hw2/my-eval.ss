(define my-eval
  (lambda (e)
    (cond
      ((null? e) null)
      ((equal? (car e) '+) (+ (cadr e) (car (cddr e))))
      ; need to check if the other args are a list for nested
      ((equal? (car e) '-) (- (cadr e) (car (cddr e))))
      ; need to check if the other args are a list for nested
      (else (my-eval e)))))

(display (my-eval '(+ 11 16)))
(newline)
(display (my-eval '(- (+ 11 16) 23)))
(newline)
