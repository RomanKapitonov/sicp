(define (make-segment p q) (cons p q))

(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (make-point x y) (cons x y))

(define (segment-length s)
  (let ((a (start-segment s))
        (b (end-segment s)))
    (sqrt (+ (square (- (x-point b)
                        (x-point a)))
             (square (- (y-point b)
                        (y-point a)))))))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; *-------
;; |      |
;; --------
;; * - origin
(define (make-rect origin width height)
  (cons origin (cons width height)))

(define (width rect)
  (car (cdr rect)))

(define (height rect)
  (cdr (cdr rect)))

(define (area rect)
  (* (width rect)
     (height rect)))

(define (double a)
  (* a 2))

(define (perimeter rect)
  (+ (double (width rect))
     (double (height rect))))

(define (test-origin)
  (make-point 5 5))

(define (test-rect)
  (make-rect (test-origin) 5 5))

(newline)
(display "Perimeter: ")
(display (perimeter (test-rect)))
(newline)
(display "Area: ")
(display (area (test-rect)))

(define (make-rect2 left-segment bottom-segment)
  (cons left-segment bottom-segment))

(define (width2 rect)
  (segment-length (cdr rect)))

(define (height2 rect)
  (segment-length (car rect)))

(define (perimeter2 rect)
  (+ (double (height2 rect))
     (double (width2 rect))))

(define (area2 rect)
  (* (height2 rect) (width2 rect)))

(define (test-left-segment)
  (make-segment (make-point 0 0) (make-point 0 5)))

(define (test-bottom-segment)
  (make-segment (make-point 0 0) (make-point 5 0)))

(define (test-rect2)
  (make-rect2 (test-left-segment) (test-bottom-segment)))

(newline)
(display "Perimeter 2: ")
(display (perimeter2 (test-rect2)))
(newline)
(display "Area 2: ")
(display (area2 (test-rect2)))

