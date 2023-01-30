(ert-deftest aset-test ()
  "arrayのインデックスを指定して破壊的変更する"
  (let ((v (vector 1 2 3)))
    (aset v 0 10)
    (should (eq 10 (elt v 0)))))
