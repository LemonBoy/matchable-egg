(module matchable *
  (import scheme chicken)
  (use lolevel)

  ;; CHICKEN-specific glue

  ;; slot-ref type obj n
  ;; Returns the 'n'th field of the record 'obj'.
  (define-syntax slot-ref
    (syntax-rules ()
      ((_ type obj n) (record-instance-slot obj n))))

  ;; slot-set! type obj n val
  ;; Sets the value of the 'n'th field of the record 'obj' to 'val'.
  (define-syntax slot-set!
    (syntax-rules ()
      ((_ type obj n val) (record-instance-slot-set! obj n val))))

  ;; is-a? obj type
  ;; Returns #t if 'obj' is a record with name 'type', #f otherwise.
  (define-syntax is-a?
    (syntax-rules ()
      ((_ obj type) (record-instance? obj (quote type)))))

  (include "match.scm")
)
