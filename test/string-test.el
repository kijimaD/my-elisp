(ert-deftest version-to-list-test ()
  "バージョン番号をリスト化する"
  (should (equal '(1) (version-to-list "1")))
  (should (equal '(1 2) (version-to-list "1.2")))
  (should (equal '(1 2 3) (version-to-list "1.2.3")))
  (should (equal '(1 2 3 4) (version-to-list "1.2.3.4"))))

(ert-deftest intern-test()
  "文字列をシンボル化する"
  (should (eq 'sym (intern "sym")))
  (let (sym)
    (setq sym "test")
    ;; 文字列をシンボル化 → 評価して文字列 → シンボル化 → 評価
    (should (equal "test" (eval (intern "sym"))))))

(ert-deftest symbol-function-test()
  "シンボルの関数定義を調べる"
  (declare-function my-func "my")
  (defun my (n) (+ n 1))
  (should (equal (lambda (n) (+ n 1)) (symbol-function 'my))))

(ert-deftest apply-test()
  "関数を適用する"
  (should (eq 10 (apply '+ 1 2 '(3 4))))
  (should (eq 15 (apply '+ '(1 2 3 4 5))))
  (should (eq 15 (apply '+ 1  2 '(3 4 5)))))

(ert-deftest dolist-test1()
  "ループ処理"
  (let ((result 0))
    (dolist (num '(1 2 3 4 5))
      (setq result (+ result num)))
    (should (equal 15 result))))

(ert-deftest dolist-test2()
  "ループ処理"
  (let (result)
    (dolist (num '(1 2 3 4 5))
      (setq result (cons num result)))
    (should (equal '(5 4 3 2 1) result))))
