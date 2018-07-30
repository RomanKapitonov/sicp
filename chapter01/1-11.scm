(define (trib n)
  (if (< n 3)
    n
    (+ (+ (trib (- n 1)) (trib (- n 2))) (trib (- n 3))) ))

(define (trib2 n)
  (trib-iter 2 1 0 n))

(define (trib-iter a b c count)
  (if (= count 0)
    c
  (trib-iter (+ a b c) a b (- count 1))))