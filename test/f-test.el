(require 'ert)
(require 'f)

(ert-deftest f-expand-test ()
  "絶対パスを生成する"
  (let ((path (f-expand "file")))
    (should (string-match-p "file" path))
    (should (eq t (file-name-absolute-p path)))))

(ert-deftest f-read-test ()
  "ファイルの中身を書き込む+読み込む"
  (f-write-text "content" 'utf-8 "./tmp")
  (should-not (zerop (length (f-read-text "tmp"))))
  (if (f-file? "tmp") (delete-file "tmp")))

(ert-deftest f-file?-test ()
  (f-write-text "content" 'utf-8 "./tmp")
  (should (eq t (f-file? "tmp")))
  (should (eq nil (f-file? "not exist")))
  (if (f-file? "tmp") (delete-file "tmp")))

(ert-deftest f-ext?-test ()
  (let ((tmp "tmp.el"))
    (with-temp-file tmp)
    (should (eq t (f-ext? tmp "el")))
    (should (eq nil (f-ext? tmp "org")))
    (if (f-file? tmp) (delete-file tmp))))
