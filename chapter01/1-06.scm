(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
      x)));

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-my x)
  (sqrt-iter 1.0 x))

; Scheme uses applicative computation when calling new-if, so
; 1. compute (good-enough? guess x)
; 2. compute r = (improve guess x)
; 3. compute sqrt-iter r
; Here the interpreter falls into infinite recursion,
; so we need to use built in condition in order to fix that.
;
; (define (new-if predicate then-clause else-clause)
;   (cond (predicate then-clause)
;         (else else-clause)))
;
; (define (sqrt-iter guess x)
;   (new-if (good-enough? guess x)
;     guess
;     (sqrt-iter (improve guess x)
;       x)))
