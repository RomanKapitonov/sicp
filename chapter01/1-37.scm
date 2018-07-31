(define (cont-frac n d k)
  (define (below i)
    (if (> i k)
        (d i)
        (/ (n i) (+ (d i) (below (+ i 1))))))
  (below 1))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

(define (cont-frac-iter n d k)
  (define (iter i acc)
    (if (> i k)
        acc
        (/ acc (+ (d i) (iter (+ i 1) acc)))))
  (iter 1 (n 1)))

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                10)
