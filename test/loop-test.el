(ert-deftest dolist-test1()
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

(ert-deftest dolist-test2()
  (let (result)
    (dolist (element '(1 2 3))
      (setq result (cons (* element 2) result)))
    (should (equal '(6 4 2) result))))
