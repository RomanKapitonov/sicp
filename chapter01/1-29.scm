(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(define (cube x)
  (* x x x))

(define (inc x)
  (+ x 1))

(define (simpson f a b n)
  (define h
    (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (term k)
    (cond ((= k 0) (y k))
          ((even? k) (* 2 (y k)))
          (else (* 4 (y k)))))
  (* (/ h 3) (sum term 0 inc n)))
