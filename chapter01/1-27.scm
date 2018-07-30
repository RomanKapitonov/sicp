;; 561, 1105, 1729, 2465, 2821 and 6601

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (iter a)
    (if (< a n)
        (if (try-it a)
            (iter (+ a 1))
            #f)
        #t))
  (iter 1))


(map fermat-test '(561 1105 1729 2465 2821 6601))
