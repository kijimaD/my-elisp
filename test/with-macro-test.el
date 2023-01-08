(defmacro with-test ()

  )

(defmacro my-with-ansi (&rest body)
  `(cl-macrolet
       ,(mapcar
         (lambda (alias)
           (let ((fn (intern (format "my-ansi-%s" (symbol-name alias)))))
             `(,alias (string &rest objects)
                      ,(list 'backquote (list fn ',string ',@objects)))))
         (append
          (mapcar 'car my-ansi-colors)))
     ,(cons 'ansi--concat body)))

;; cl-macroletがどういう働きをしてるのかわからん
;; 最後にconsが出てくるのがわからん

(my-with-ansi "aa" (black "black") "aa")

(defconst my-ansi-colors
  '((black))
  "List of text colors.")

(defun my-ansi-black (sym) "[BLACK]")
