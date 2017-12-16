(define (all-satisfies lst pred)
	(cond 
		((null? lst) True)
		((pred (car lst)) (all-satisfies (cdr lst) pred))
		(else False)))

(define (interleave list1 list2)
	(if (or (null? list1) (null? list2))
		(append list1 list2)
		(cons (car list1)
			(cons (car list2)
				(interleave (cdr list1) (cdr list2))))))
(define (num-adjacent-matches s)
	(cond 
		((or (null? s) (null? (cdr s))) 0)
		((= (car s) (car (cdr s))) (+ 1 (num-adjacent-matches (cdr s))))
		(else (num-adjacent-matches (cdr s)))))

(define (split-at lst n)
	(cond 
		((= n 0) (cons nil lst))
		((null? lst) (cons nil nil))
		(else (let ((rec (split-at (cdr lst) (- n 1))))
			(cons (cons (car lst) (car rec)) (cdr rec))))))