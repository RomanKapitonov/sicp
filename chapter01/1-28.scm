;; 561, 1105, 1729, 2465, 2821 and 6601

(define (expmod base exp m)
  (define (is-nontrivial-square? x n)
    (cond ((and (or (not (= x 1))
                    (not (= x (- n 1))))
                (= (remainder (square x) n) 1))
           0)
          (else x)))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (is-nontrivial-square? (expmod base (/ exp 2) m) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (iter a)
    (if (< a n)
        (if (try-it a)
            (iter (+ a 1))
            #f)
        #t))
  (iter 1))


(map miller-rabin '(561 1105 1729 2465 2821 6601))
