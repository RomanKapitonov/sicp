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

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      false))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start)
  (define (iter n count acc)
    (if (= count 3)
        acc
        (if (timed-prime-test n)
            (iter (+ n 1) (+ count 1) (cons n acc))
            (iter (+ n 1) count acc))))
  (iter start 0 '()))

