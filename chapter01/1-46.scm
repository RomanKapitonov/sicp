(define (iterative-improve good-enough? improve)
  (define (test guess)
    (let ((next-value (improve guess)))
      (if (good-enough? guess next-value)
          next-value
          (test next-value))))
  (lambda (guess) (test guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

;; (define (good-enough? guess next-guess)
;;   (< (abs (- (square next-guess) guess)) 0.001))
;; (define (improve guess)
;;   (average guess (/ x guess)))

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess next-guess)
    (< (abs (- (square next-guess) x)) 0.001))
  ((iterative-improve good-enough? improve) x))

(define tolerance 0.00001)

(define (fixed-point f x)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve close-enough? improve) x))

(define (sqrt-transformation x)
  (lambda (y) (/ x y)))

(define (average-damp f)
  (define (average a b)
    (/ (+ a b) 2))
  (lambda (x) (average x (f x))))

(define (sqrt2 x)
  (fixed-point (average-damp (sqrt-transformation x)) 1.0))

