(define (cont-frac n d k)
  (define (below i)
    (if (> i k)
        (d i)
        (/ (n i) (+ (d i) (below (+ i 1))))))
  (below 1))

(define (cont-frac-iter n d k)
  (define (iter i acc)
    (if (> i k)
        acc
        (/ acc (+ (d i) (iter (+ i 1) acc)))))
  (iter 1 (n 1)))

;; 1 2 1 1 4 1 1 6 1 1 8 1 1 10 ...
(define (d k)
  (if (or (= (remainder k 3) 1) (= (remainder k 3) 0))
      1
      (* 2 (+ 1 (quotient k 3))))
  )

(cont-frac (lambda (x) 1.0)
           d
           100)
