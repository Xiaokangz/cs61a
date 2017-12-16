;; More Scheme ;;

(define (map fn s)
  (if (null? s) nil
      (cons (fn (car s))
            (map fn (cdr s)))))

(define (filter fn s)
  (cond ((null? s) nil)
        ((fn (car s)) (cons (car s)
                            (filter fn (cdr s))))
        (else (filter fn (cdr s)))))

(define (tally names)
  (map (lambda (x) (cons x (count x names))) (unique names))
  ;'YOUR-CODE-HERE
  ;nil
)


; Using this helper procedure is optional. You are allowed to delete it.
(define (unique s)
  (if (null? s) nil
    (cons (car s) (filter (lambda (x) (not (eq? x (car s)))) (unique (cdr s)))))
  ;'YOUR-CODE-HERE
  ;nil
)
; Using this helper procedure is optional. You are allowed to delete it.
(define (count name s)
  (cond ((null? s) 0)
    ((eq? name (car s)) (+ 1 (count name (cdr s))))
    (else (count name (cdr s))))
  ;'YOUR-CODE-HERE
  ;nil
)

;; Streams ;;

(define (rle s)
  ;'YOUR-CODE-HERE
  (define (helper-rle pre n s)
    (cond ((null? s) (cons-stream (list pre n) nil))
      ((eq? (car s) pre) (helper-rle pre (+ n 1) (cdr-stream s)))
      (else (cons-stream (list pre n) (helper-rle (car s) 1 (cdr-stream s))))))
  (if (null? s) nil
    (helper-rle (car s) 1 (cdr-stream s)))
)

;; For Testing Purposes

(define (list-to-stream lst)
    (if (null? lst) nil
                    (cons-stream (car lst) (list-to-stream (cdr lst))))
)
(define (stream-to-list s)
    (if (null? s) nil
                 (cons (car s) (stream-to-list (cdr-stream s))))
)