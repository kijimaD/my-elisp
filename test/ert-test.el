(ert-deftest deftest-test ()
  "Ert-deftestがプロパティを登録する"
  (ert-deftest xxx-test () 1)
  (should (get 'xxx-test 'ert--test))
  (should-not (get 'not-exist-test 'ert--test)))
