(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; I will use lambda forms of the expression to keep it brief:
;; Definition:
;; +1: λnfx.(f ((n f) x))
;; 0 : λgy.y
;;
;; Deducing implicit form of one
;;
;; Beta-reduction of (add-1 zero):
;; (λnfx.(f ((n f) x))) (λgy.y)
;; λfx.(f (((λgy.y) f) x))
;; λfx.(f ((λy.y) x))
;; λfx.f x => 1

(define (one f) (lambda (x) (f x)))

;; Deducing implicit form of two
;; Definition:
;; 1 : λfx.f x
;; +1: λnfx.(f ((n f) x))
;;
;; Beta-reduction of (add-1 one):
;; (λnfx.(f ((n f) x))) (λfx.f x)
;; Alfa convert the statement:
;; (λfx.f x) => (λgy.g y)
;; Deduce
;; (λnfx.(f ((n f) x))) (λgy.g y)
;; (λfx.(f (((λgy.g y) f) x)))
;; (λfx.(f ((λy.f y) x)))
;; (λfx.(f (f x))) => 2

(define (two f) (lambda (x) (f (f x))))

;; Deducing 1 + 2:
;; (plus one two)
;; Let a == (λfx.(f (f x))) then:
;; (a f) => (λfx.(f (f x))) f => (λx.(f (f x)))
;; Let a == (λfx.(f x))) then:
;; (b f) => (λfx.(f x))) f => (λx.(f x))
;; (λx.(f x)) x => (f x)
;; (λx.(f (f x))) (f x) => (f (f (f x))) =>
;; (λabfx.((a f) ((b f) x)) == (+ a b)

;; Lets try 3 + 4:
;; (plus three four)
;; three == (λfx.(f (f (f x))))
;; four  == (λfx.(f (f (f (f x)))))
;; (three f) => (λfx.(f (f (f x)))) f => (λx.(f (f (f x))))
;; (four f)  => (λfx.(f (f (f (f x))))) f => (λx.(f (f (f (f x)))))
;; (plus three four): need to substitute x with b-increment so:
;; (λx.(f (f (f x)))) (λx.(f (f (f (f x))))) =>
;; (f (f (f (λx.(f (f (f (f x)))))))) =>
;; We may wrap higher context with lambda, so:
;; (λx.(f (f (f (f (f (f (f x)))))))) => definition of (seven)
;; Finally:

(define (plus a b) (lambda (f) (lambda (x) ((a f) ((b f) x)))))
