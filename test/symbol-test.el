(ert-deftest define-symbol-prop-test ()
  "Symbolで値を登録する.
\(define-symbol-prop SYMBOL PROP VAL)
\(get SYMBOL PROPNAME)"
  (define-symbol-prop 'test-symbol 'test-group '(1 2 3))
  (should (equal '(1 2 3) (get 'test-symbol 'test-group))))
