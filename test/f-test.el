(require 'ert)
(require 'f)

(ert-deftest f-expand-test ()
  "絶対パスを生成する"
  (let ((path (f-expand "file")))
    (should (string-match-p "file" path))
    (should (eq t (file-name-absolute-p path)))))

(ert-deftest f-read-test ()
  "ファイルの中身を読み込む"
  (should-not (zerop (length (f-read-text "f-test.el")))))

(ert-deftest f-write-test ()
  "ファイルに書き込む"
  (with-temp-file "tmp"
    (f-write-text "content" 'utf-8 "./tmp")
    (should-not (zerop (length (f-read-text "./tmp"))))))
