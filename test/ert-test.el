(ert-deftest deftest-test ()
  "Ert-deftestがプロパティを登録する"
  (ert-deftest xxx-test () 1)
  (should (get 'xxx-test 'ert--test))
  (should-not (get 'not-exist-test 'ert--test))
  (ert-delete-all-tests))

(ert-deftest obarray-test ()
  "deftestで定義されているテストの一覧を得る"
  (ert-deftest xxx-test () 1)
  (ert-deftest yyy-test () 1)
  obarray
  (let ((result (seq-filter (lambda (i) (when (symbolp i) (ert-test-boundp i))) obarray)))
    (should (equal '(yyy-test xxx-test) result)))
  (ert-delete-all-tests))
