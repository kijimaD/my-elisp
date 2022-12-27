(require 'ert)
(require 'f)

(ert-deftest f-expand-test ()
  "対象ファイルへの絶対パスを含む"
  (let ((path (f-expand "file")))
    (should (string-match-p "file" path))
    (should (eq t (file-name-absolute-p path)))))
