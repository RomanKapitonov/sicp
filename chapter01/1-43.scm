(define (compose f g)
  (lambda (x) (f (g x))))

;; Recursive approach
(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

((repeated square 2) 5)

;; Iterative approach
(define (repeated-iter f n)
  (define (iter k acc)
    (if (= k 1)
        acc
        (iter (- k 1) (compose f acc))))
  (iter n f))

((repeated-iter square 2) 5)

