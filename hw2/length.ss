; require trace library so we can trace the progress
(require (lib "trace.ss"))
(define length
  (lambda (l)
    (if (null? l)
        0
        (+ 1 (length (cdr l))))))

; turn on tracing for length function
(trace length)

; test the length function on an example list
(length '(1 2 3 4))
