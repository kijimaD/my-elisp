(require 'epl)
(require 'cl-lib)

(defmacro my-with-ansi (&rest body)
  "with関数内でblack, white関数をバインドする"
  `(cl-macrolet
       ,(mapcar
         (lambda (alias)
           `(,alias                     ; 関数名
             (string)                   ; 引数
             ,(list 'backquote (list 'concat "<" (symbol-name alias) ">" ',string "</" (symbol-name alias) ">")))) ; 本体
         '(black white)                 ; 関数リスト
         )
     ,(cons 'my-ansi--concat body)))

(defun my-ansi--concat (&rest sequences)
  (apply #'concat (cl-remove-if-not 'stringp sequences)))

(ert-deftest my-with-ansi-test ()
  (let ((result-b (my-with-ansi "this is " (black "text")))
        (result-w (my-with-ansi "this is " (white "text"))))
    (should (string= "this is <black>text</black>" result-b))
    (should (string= "this is <white>text</white>" result-w))))

(ert-deftest destructuring-bind-test ()
  (let ((result (cl-destructuring-bind ((a &optional (b 'bee)) one two three)
                    `((alpha) 3 2 1)
                  (list a b three two one))))
    (should (equal '(alpha bee 1 2 3) result))))

(defun my--eval (forms)
  "DSLを定義する"
  (let ((result ""))
    (dolist (form forms)
      (cl-case (car form)
        (dsl1
         (cl-destructuring-bind (_ content) form ;; carはdsl1なので捨てる
           (setq result (concat result "<dsl1 " content ">"))))
        (dsl2
         (cl-destructuring-bind (_ content) form ;; carはdsl2なので捨てる
           (setq result (concat result "<dsl2 " content ">"))))))
    result))

(ert-deftest my--eval-test ()
  (let ((result (my--eval '((dsl1 "1") (dsl2 "2")))))
    (should (string= "<dsl1 1><dsl2 2>" result)))
  (let ((result (my--eval '((dsl1 "1") (dsl3 "3")))))
    (should (string= "<dsl1 1>" result))))

(ert-deftest epl-package-test ()
            (let ((package (epl-package-create
                            :name "yasnippet"
                            :description (package-desc-create :name "desc" :version "1.0.0"))))
              (should (eq nil (epl-package-installed-p package)))
              (should (eq t (epl-package-p package)))
              (should (string= "1.0.0" (epl-package-version package)))
              (should (string= "yasnippet" (epl-package-name package)))))
