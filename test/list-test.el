(ert-deftest elt-test ()
  "リストからN番目を取り出す。"
  (let ((list '(1 2 3 4 5)))
    (should (eq 1 (elt list 0)))
    (should (eq 2 (elt list 1)))
    (should (eq 5 (elt list 4)))
    (should (eq nil (elt list 10)))))

(ert-deftest setf-test ()
  "setf"
  (let ((list '("1" "2" "3")))
    (setf (elt list 1) "10")
    (should (equal '("1" "10" "3") list))
    ))
