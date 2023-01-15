(ert-deftest general-var-test ()
  "setfは汎変数マクロ"
  (let ((list '("1" "2" "3")))
    (setf (elt list 1) "10")
    (should (equal '("1" "10" "3") list))
    ))
