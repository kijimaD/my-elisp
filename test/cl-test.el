(require 'cl-lib)

(ert-deftest defstruct-test ()
  ;; 構造体定義
  (cl-defstruct box width height)

  ;; 初期化
  (setq  b1 (make-box :width 600 :height 300))

  ;; スロットにアクセスできる
  (should (eq 600 (box-width b1)))
  (should (eq 300 (box-height b1))))
