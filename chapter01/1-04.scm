; The operation to be applied to a and b is defined based on the sign of b
;
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))