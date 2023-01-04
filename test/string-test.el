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

(ert-deftest dolist-test0()
  "
(dolist (VAR LIST [RESULT]) BODY...)
1: 1ループの変数
2: リスト
3: Body

引数の形が特殊なことに注目。VARとLISTは1つのリストで、bodyとは別のリストである。こういうのはdefmacroで定義されている。
"
  (let (result)
    (dolist (element '(1 2 3))
      (setq result (cons element result)))
    (should (equal '(3 2 1) result))
    ))

(ert-deftest dolist-test1()
  (let (result)
    (dolist (element '(1 2 3))
      (setq result (cons (* element 2) result)))
    (should (equal '(6 4 2) result))))


(ert-deftest dolist-test2()
  "ループ処理"
  (let ((result 0))
    (dolist (num '(1 2 3 4 5))
      (setq result (+ result num)))
    (should (equal 15 result))))

(ert-deftest s-join-test()
  "セパレータ指定してjoinする"
  (let ((result (s-join ", " '("a" "b" "c"))))
    (should (equal "a, b, c" result))))

(ert-deftest symbol-name-test ()
  "シンボル名を文字列に変換する"
  (should (equal "cons" (symbol-name 'cons))))
