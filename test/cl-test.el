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
