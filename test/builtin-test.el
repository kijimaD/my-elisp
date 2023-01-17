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

(ert-deftest unwind-protect-test ()
  "データ構造を一時的に不整合にする可能性にあるときに使う。失敗したときはcleanup formを実行する
(unwind-protect BODYFORM UNWINDFORMS...)"
  (let* ((temp "*temp*")
         (buffer (get-buffer-create temp)))
    (with-current-buffer buffer
      (unwind-protect
          (progn
            (should (get-buffer temp))
            (kill-buffer buffer))
        (should-not (get-buffer temp))))))
