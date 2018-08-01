(define (make-segment p q) (cons p q))

(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (average a b)
  (/ (+ a b) 2))

(define (midpoint-segment s)
  (make-point (average (x-point (start-segment s))
                       (x-point (end-segment s)))
              (average (y-point (start-segment s))
                       (y-point (end-segment s)))))

(define (origin)
  (make-point 0 0))

(define (ten)
  (make-point 10 0))

(define (test-segment)
  (make-segment (origin) (ten)))

(define (print-segment s)
  (print-point (start-segment s))
  (print-point (end-segment s)))

(print-segment (test-segment))

(print-point (midpoint-segment (test-segment)))

