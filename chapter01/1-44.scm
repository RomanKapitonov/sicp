(define (compose f g)
  (lambda (x) (f (g x))))

(define dx 0.00001)

(define (smooth f)
  (define (mean a b c) (/ (+ a b c) 3))
  (lambda (x) (mean (f (- x dx)) (f x) (f (+ x dx)))))

(define (repeated f n)
  (define (iter k acc)
    (if (= k 1)
        acc
        (iter (- k 1) (compose f acc))))
  (iter n f))

(define (smooth-n-times f n)
  ((repeated smooth n) f))

