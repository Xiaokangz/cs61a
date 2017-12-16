(define (find s predicate)
	(cond 
		((null? s) #f)
		((predicate (car s)) (car s))
		(else (find (cdr-stream s) predicate)))
  ;'YOUR-CODE-HERE
)

(define (scale-stream s k)
	(cons-stream (* k (car s)) (scale-stream (cdr-stream s) k))
  ;'YOUR-CODE-HERE
)

(define (has-cycle s)
	(define (same? lst s)
		(cond
			((null? lst) #f)
			((eq? (car lst) s) #t)
			(else (same? (cdr lst) s))))
	(define (has-cycle-in-lst lst s)
		(cond
			((null? s) #f)
			((same? lst s) #t)
			(else (has-cycle-in-lst (cons s lst) (cdr-stream s)))))
	(has-cycle-in-lst nil s)
  ;'YOUR-CODE-HERE
)
(define (has-cycle-constant s)
	(define (cycle? slow fast)
		(cond
			((or (null? fast) (null? (cdr-stream fast))) #f)
			((or (eq? fast slow) (eq? (cdr-stream fast) slow)) #t)
			(else (cycle? (cdr-stream slow) (cdr-stream (cdr-stream fast))))))
	(cycle? s (cdr-stream s))
  ;'YOUR-CODE-HERE
)

(define (double_naturals)
	(double_naturals_helper 1 0))

(define (double_naturals_helper first go-next)
	(cons-stream first (double_naturals_helper (+ first go-next) (- 1 go-next))))

(define (interleave stream1 stream2)
	(cons-stream (car stream1)
		(interleave stream2 (cdr-stream stream1))))



































