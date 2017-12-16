(define (merge s1 s2)
	(if (< (car s1) (car s2))
		(cons-stream (car s1) (merge (cdr-stream s1) s2))
		(cons-stream (car s2) (merge s1 (cdr-stream s2)))))

(define (cycle start)
	(cons-stream start (cycle (remainder (+ start 2) 5))))