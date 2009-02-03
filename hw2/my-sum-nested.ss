; this my-sum should work for nested lists
(define my-sum
  (lambda (l)
    (if (null? l)
      0
      (+ (if (list? (car l))
           (my-sum (car l))
           (car l))
         (my-sum (cdr l))))))

; test it with a random nested list
(my-sum '('(2 4) 6))
