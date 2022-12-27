(ert-deftest eq-test ()
  "eqとequalの挙動の違い。
eqはオブジェクトを比較する。
equalは値を比較する。"
  (should-not (eq "a" "a"))
  (should (equal "a" "a")))
