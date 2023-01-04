(ert-deftest eq-test ()
  "eqとequalの挙動の違い。
eqはオブジェクトを比較する。
equalは値を比較する。文字列は中身は同じでも違うオブジェクトになるため、値を比較しなければならない。"
  ;; 実行はできるけど、compile errorになるからコメントアウト
  ;; (should-not (eq "a" "a"))
  (should (equal "a" "a")))
