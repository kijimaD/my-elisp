(ert-deftest subrp-test ()
  (should (eq t (subrp (symbol-function 'cons))))
  (should (eq nil (subrp (symbol-function 'ert-deftest)))))
