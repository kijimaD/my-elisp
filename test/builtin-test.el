(ert-deftest subrp-test ()
  "組み込み関数か判定する."
  (should (eq t (subrp (symbol-function 'cons))))
  (should (eq nil (subrp (symbol-function 'ert-deftest)))))

(ert-deftest when-let ()
  "定義する変数の中身がnilだった場合は、body部分を実行しない."
  (let* ((result (when-let ((name "test"))
                   (format "this is %s" name))))
    (should (string= "this is test" result)))
  (let* ((result (when-let ((name nil))
                   (format "%s" name))))
    (should (eq nil result))))
