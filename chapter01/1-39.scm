(define (cont-frac n d k)
  (define (below i)
    (if (> i k)
        1
        (/ (n i) (+ (d i) (below (+ i 1))))))
  (below 1))

(define (cont-frac-iter n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1) (/ (n i) (+ (d i) acc)))))
  (iter k 0))

(define (square x)
  (* x x))

(define (tan-cf-iter x k)
  (define (n i)
    (if (= i 1)
        x
        (- (square x))))
  (define (d i)
    (- (* i 2) 1))
  (cont-frac-iter n
                  d
                  k))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (- (square x))))
  (define (d i)
    (- (* i 2) 1))
  (cont-frac n
             d
             k))

