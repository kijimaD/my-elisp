(defmacro my-with-ansi (&rest body)
  `(cl-macrolet
       ,(mapcar
         (lambda (alias)
           `(,alias                     ; 関数名
             (string)                   ; 引数
             ,(list 'backquote (list 'concat "<" (symbol-name alias) ">" ',string "</" (symbol-name alias) ">")))) ; 本体
         '(black white)                       ; 関数リスト
         )
     ,(cons 'my-ansi--concat body)))

(defun my-ansi--concat (&rest sequences)
  (apply #'concat (cl-remove-if-not 'stringp sequences)))

(ert-deftest my-with-ansi-test ()
  (let ((result-b (my-with-ansi "this is " (black "text")))
        (result-w (my-with-ansi "this is " (white "text"))))
    (should (string= "this is <black>text</black>" result-b))
    (should (string= "this is <white>text</white>" result-w))))
