; 1 2 3 4 5 6
; 1 1
; 2 1 1
; 3 1 2 1
; 4 1 3 3 1
; 5 1 4 6 4 1
;
(define (pascal i j)
  (cond ((= i 1) 1)
        ((= j 1) 1)
        ((< i j) -1)
        (else (+ (pascal i (- j 1)) (pascal (- i 1) (- j 1))))))
