(ert-deftest cons-test ()
  "関数と引数をつなげてevalできる"
  (should (equal '(progn "a" "i" "u") (cons 'progn '("a" "i" "u"))))
  (should (equal (eval '(progn "a" "i" "u")) "u")))
