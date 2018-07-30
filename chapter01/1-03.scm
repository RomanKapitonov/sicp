(define (sqr x) (* x x))

(define (sumsqr a b) (+ (sqr a) (sqr b)))

(define (msquare a b c)
  (cond
    ((and (>= a c) (>= b c)) (sumsqr a b))
    ((and (>= b a) (>= c a)) (sumsqr b c))
    ((and (>= a b) (>= c b)) (sumsqr a c))
  ))

; (msquare 1 2 2)