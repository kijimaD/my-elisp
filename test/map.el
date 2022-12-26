(require 'ert)

(ert-deftest mapcar-test ()
  (should (equal '(a c e) (mapcar (function car) '((a b) (c d) (e f)))))
  (should (equal '(2 3 4) (mapcar (function 1+) '(1 2 3))))
  (should (equal '("a" "b" "c") (mapcar (function char-to-string) "abc")))
  (should (equal '("a" "b" "c") (mapcar 'char-to-string "abc"))))
