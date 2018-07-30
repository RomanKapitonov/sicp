(define (accumulate combiner null-value term a next b)
  (if (> a b)
       null-value
       (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter x accumulator)
    (if (> x b)
        accumulator
        (iter (next x) (combiner (term x) accumulator))))
  (iter a null-value))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

; (define (identity x) x)
; (define (inc x) (+ x 1))

; (product-iter identity 1 inc 10)
; (sum-iter identity 1 inc 10)