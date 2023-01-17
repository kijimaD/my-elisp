(ert-deftest deftest-test ()
  "Ert-deftestがプロパティを登録する."
  (ert-deftest xxx-test () 1)
  (should (get 'xxx-test 'ert--test))
  (should-not (get 'not-exist-test 'ert--test))
  (ert-delete-all-tests))

(ert-deftest obarray-test ()
  "Deftestで定義されているテストの一覧を得る."
  (ert-deftest xxx-test () 1)
  (ert-deftest yyy-test () 1)
  (let ((result (seq-filter (lambda (i) (when (symbolp i) (ert-test-boundp i))) obarray)))
    (should (equal '(yyy-test xxx-test) result)))
  (ert-delete-all-tests))

(ert-deftest ert-get-test ()
  "テストの本体を取得する。発見できないときはエラーを返す."
  (ert-deftest xxx-test () 1)
  (should (ert-get-test 'xxx-test))
  (should-error (ert-get-test 'undefined-test))
  (ert-delete-all-tests))

(ert-deftest ert-test-boundp-test ()
  "テストが存在するか確認する."
  (ert-deftest xxx-test () 1)
  (should (ert-test-boundp 'xxx-test))
  (should-not (ert-test-boundp 'undefined-test))
  (ert-delete-all-tests))
