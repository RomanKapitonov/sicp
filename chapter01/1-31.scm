(define (identity x) x)

(define (inc x)
  (+ x 1))

;; Linear recursion
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

;; Iterative
(define (product-iter term a next b)
  (define (iter a product)
    (if (> a b)
        product
        (iter (next a) (* (term a) product))))
  (iter a 1))

(define (factorial n)
  (product identity 1 inc n))

(define (pi n)
  (define (term-num x)
    (* 4 x x))
  (define (term-den x)
    (- (* 4 x x) 1))
  (* 2.0 (/ (product-iter term-num 1 inc n)
          (product-iter term-den 1 inc n))))
