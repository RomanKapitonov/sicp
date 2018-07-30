(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         ; because of the applicative order the below will be executed two times instead of one,
         ; therefore we end up with 2^log(n) which reduces to n, hence the complexity is O(n) instead of O(log(n))
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
