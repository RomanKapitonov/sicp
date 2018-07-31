(define tolerance 0.00001)

(define (average-damp f)
  (define (average a b)
    (/ (+ a b) 2))
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

;; Iterative approach
(define (repeated f n)
  (define (iter k acc)
    (if (= k 1)
        acc
        (iter (- k 1) (compose f acc))))
  (iter n f))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (square-root-transform x)
  (lambda (y) (/ x y)))

(define (cubic-root-transform x)
  (lambda (y) (/ x (* y y))))

(define (fourth-root-transform x)
  (lambda (y) (/ x (* y y y))))

(define (fifth-root-transform x)
  (lambda (y) (/ x (* y y y y))))

(define (fixed-point-with-transformation f transform guess)
  (fixed-point (transform f) guess))

(define (square-root x)
  (fixed-point-with-transformation (square-root-transform x) average-damp 1.0))

(define (cubic-root x)
  (fixed-point-with-transformation (cubic-root-transform x) average-damp 1.0))

(define (fourth-root x)
  (fixed-point-with-transformation (fourth-root-transform x) (repeated average-damp 2) 1.0))

(define (fifth-root x)
  (fixed-point-with-transformation (fifth-root-transform x) (repeated average-damp 2) 1.0))

(define (log-base base x)
  (/ (log x) (log base)))

(define (nth-root x n)
  ;; (define (root-transform x)
  ;;   (lambda (y) (/ x (expt y (- n 1)))))
  (let ((number-of-damps (floor (log-base 2 n))))
    (fixed-point-with-transformation (lambda (y) (/ x (expt y (- n 1))))
                                     (repeated average-damp number-of-damps)
                                     1.0)))

(newline)
(display (square-root 2))
(newline)
(display (cubic-root 2))
(newline)
(display (fourth-root 2))
(newline)
(display (fifth-root 2))
(newline)
(display (nth-root 2 2))
(newline)
(display (nth-root 2 9))
