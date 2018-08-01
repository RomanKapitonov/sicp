(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (define (sign x)
    (if (< x 0)
        (- 1)
        1))
  (let ((g (gcd (abs n) (abs d))))
    (cons (* (sign n) (sign d) (/ (abs n) g))
          (/ (abs d) g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (numer y))
               (* (denom x) (denom y)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (eql-rat x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (one-half)
  (make-rat 1 2))

(define (minus-one-half)
  (make-rat (- 1) 2))

(print-rat (one-half))
(print-rat (minus-one-half))
(print-rat (mul-rat (minus-one-half) (minus-one-half)))
(print-rat (add-rat (one-half) (minus-one-half)))
(print-rat (add-rat (one-half) (one-half)))

