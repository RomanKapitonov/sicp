(define (square x)
  (* x x))

(define (f g)
  (g 2))

;; Error :: The object 2 is not applicalbe
;; This happens because the above evaluates to (f (f 2)). Since f expects a procedure 2 is
;; tried to be applied and obviously fails since 2 is not a procedudure
;; (f f)
