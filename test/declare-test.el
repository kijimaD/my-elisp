(ert-deftest defmacro-test1 ()
  (declare-function defmacro-exec "my")
  (let ((progn)
        (+))
    (defmacro defmacro-exec (&rest body)
      (declare (indent defun))
      (progn body))
    (should (equal "test" (defmacro-exec progn "test")))
    (should (equal 6 (defmacro-exec + 1 2 3)))))

(ert-deftest defmacro-test2 ()
  (declare-function inc-macro "my")
  (let ((count 0))
    (defmacro inc-macro (var)
      (list 'setq var (list '1+ var)))
    (inc-macro count)
    (should (eq 1 count))
    (inc-macro count)
    (should (eq 2 count))))
