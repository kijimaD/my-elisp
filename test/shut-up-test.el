(require 'shut-up)

(ert-deftest shut-up-test ()
  "shut-upは標準出力に出さなくしてBODYを評価する関数"
  (shut-up (message "hello"))
  ;; 実行できる
  ;; 標準出力をテストする方法はよくわからない
  )
