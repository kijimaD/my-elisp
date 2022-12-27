(require 'ert)

;; load all test files
(mapc 'load (file-expand-wildcards "test/*.el"))
