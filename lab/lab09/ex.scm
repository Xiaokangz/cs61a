(define (filter-stream f s)
	(cond
		((null? s) nil)
		((f (car s)) (cons-stream (car s) (filter-stream f (cdr-stream s))))
		(else (filter-stream f (cdr-stream s)))))

(define (map-stream f s)
	(if (null? s) nil
		(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

