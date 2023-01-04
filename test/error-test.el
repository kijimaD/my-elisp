(ert-deftest condition-case-test ()
;; tryフォームがエラーになったとき、elseフォームを評価する
  (condition-case err
      (/ 3 0)
    (error (princ (format "\nThe error was: %s" err)))))
