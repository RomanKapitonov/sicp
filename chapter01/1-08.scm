(define (root3 x)
  (root-iter 0.0 1.0 x))

(define (root-iter prev-guess guess x)
  (if (better-good-enough? prev-guess guess)
    guess
    (root-iter guess (improve guess x)
      x)))

(define (better-good-enough? prev-guess guess)
  (< (abs (- guess prev-guess)) 0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))
