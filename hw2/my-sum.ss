(define my-sum
  (lambda (l)
    (if (null? l)
      0
      (+ (car l)
         (my-sum (cdr l))))))

; test it with a random list
(my-sum '(2 4 6))
