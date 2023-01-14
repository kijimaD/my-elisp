(ert-deftest point-test ()
  "カーソル位置を返す."
  (with-temp-buffer
    (insert "test")
    (save-excursion
      (goto-char (point-min))
      (should (eq 1 (point))))
    (save-excursion
      (goto-char (point-max))
      (should-not (eq 4 (point))))))

(ert-deftest bolp-test ()
  "カーソルがバッファの最初にあるかを判定する."
  (with-temp-buffer
    (insert "test")
    (save-excursion
      (goto-char (point-min))
      (should (bolp)))
    (save-excursion
      (goto-char (point-max))
      (should-not (bolp)))))
