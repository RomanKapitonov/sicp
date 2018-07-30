(define (filtered-accumulate combiner null-value term a next b predicate)
  (cond ((> a b) null-value)
        ((not (predicate (term a)))
          (filtered-accumulate combiner null-value term (next a) next b predicate))
        (else (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b predicate)))))

(define (filtered-accumulate-iter combiner null-value term a next b predicate)
  (define (iter x accumulator)
    (if (> x b)
      accumulator
      (iter (next x)
            (if (predicate x)
                (combiner (term x) accumulator)
                accumulator))))
  (iter a null-value))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next n)
  (cond ((even? n) (+ n 1))
        (else (+ n 2))))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (sum-primes term a next b)
  (filtered-accumulate + 0 term a next b prime?))

(define (product-of-coprimes-before n)
  (define (coprime? x)
    (= (gcd n x) 1))
  (filtered-accumulate * 1 identity 2 inc (- n 1) coprime?))

(define (identity x) x)
(define (inc x) (+ x 1))

;; (sum-primes-iter identity 1 inc 5)
;; (product-of-coprimes-before 10)

