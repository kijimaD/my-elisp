(ert-deftest elt-test ()
  "リストからN番目を取り出す。"
  (let ((list '(1 2 3 4 5)))
    (should (eq 1 (elt list 0)))
    (should (eq 2 (elt list 1)))
    (should (eq 5 (elt list 4)))
    (should (eq nil (elt list 10)))))

(ert-deftest seq-filter-test ()
  "関数を実行して、tになるものだけリストに残す."
  (let* ((list '(1 2 3 4 5 6 7 8 9 10))
         (filtered (seq-filter (lambda (i) (eq 0 (% i 2))) list)))
    (should (equal '(2 4 6 8 10) filtered))))
