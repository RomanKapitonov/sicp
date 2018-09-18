(define (cons23 a b)
  (* (expt 2 a) (expt 3 b)))

;; 2 and 3 are coprimes so:
;;
(define (quotient-iter p n k)
  (if (= (remainder p n) 0)
      (quotient-iter (quotient p n) n (+ k 1))
      k))

(define (car23 p)
  (quotient-iter p 2 0))

(define (cdr23 p)
  (quotient-iter p 3 0))
