(module matchable *
  (import scheme chicken)

  ;; CHICKEN-specific glue

  ;; slot-ref type obj n
  ;; Returns the 'n'th field of the record 'obj', we add 1 to the index since 
  ;; the 0th field is reserved for the type.
  (define-syntax slot-ref
    (syntax-rules ()
      ((_ type obj n) (##sys#block-ref obj (add1 n)))))

  ;; slot-set! type obj n val
  ;; Sets the value of the 'n'th field of the record 'obj' to 'val'.
  (define-syntax slot-set!
    (syntax-rules ()
      ((_ type obj n val) (##sys#block-set! obj (add1 n) val))))

  ;; is-a? obj type
  ;; Returns #t if 'obj' is a record with name 'type', #f otherwise.
  (define-syntax is-a?
    (syntax-rules ()
      ((_ obj type) (##sys#structure? obj (quote type)))))

  (include "match.scm")
)
