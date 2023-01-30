(require 'cl-lib)

(ert-deftest defstruct-test ()
  "構造体を定義する."
  (let (b1)
   (cl-defstruct box width height)

  ;; 初期化
  (setq b1 (make-box :width 600 :height 300))

  ;; スロットにアクセスできる
  (should (eq 600 (box-width b1)))
  (should (eq 300 (box-height b1)))))

(ert-deftest cl-letf-test ()
  "Cl-letfはローカルスコープの関数を定義する.
モックに使える。princをinsertに置き換えて、バッファをチェックしてテストできるようにする。"
  (cl-letf (((symbol-function 'princ) #'insert))
    (with-temp-buffer
      (princ "this is test")
      (should-not (zerop (length (buffer-string))))
      )))

(ert-deftest cl-incf-test ()
  "インクリメントする."
  (let ((i 0))
    (should (eq 0 i))
    (cl-incf i)
    (should (eq 1 i))))

(ert-deftest cl-assert-test ()
  "引数のformがnon-nilかassertする."
  (let ((i 1))
    (cl-assert (eq i 1))
    ;; (cl-assert (eq i 2))  ;; => エラー
    ))

(ert-deftest cl-block-test ()
  "cl-blockとcl-returnを組み合わせてreturnを使う"
  (let* ((check 0)
         (result (cl-block my-func
                   (progn
                     (cl-return-from my-func) ;return
                     (setq check 10)    ;スルー
                     ))))
    (should (eq 0 check)))

  (let* ((check 0)
         (result (cl-block my-func
                   nil
                   (setq check "BODY"))))
    (should (string= "BODY" check))))

(ert-deftest cl-remove-if-not-test ()
  "実行結果がnilだった要素をリストから削除する"
  (let* ((list '(1 2 "3" "4" 5 6))
         (result (cl-remove-if-not 'stringp list)))
    (should (equal '("3" "4") result))))
