(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (mult a b)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (double n)
    (+ n n))
  (define (halve n)
    (/ n 2))
  (cond ((= b 0) 0)
        ((even? b) (mult (double a) (halve b)))
        (else (+ a (mult a (- b 1))))))
