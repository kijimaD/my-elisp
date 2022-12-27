.PHONY: help install test compile
.DEFAULT_GOAL := help

install: ## 依存関係インストール
	git clone https://github.com/cask/cask ~/.cask
	PATH="$HOME/.cask/bin:$PATH"
	~/.cask/bin/cask install

test: ## テストを実行する
	@echo Test start...
	~/.cask/bin/cask exec emacs \
	-Q -batch \
	-l ./setup.el \
	-f ert-run-tests-batch-and-exit

compile: ## バイトコンパイルする
	@echo Byte compile start...
	~/.cask/bin/cask exec emacs \
	-Q -batch \
	-L ./test \
	--eval "(setq byte-compile-error-on-warn t)" \
	-f batch-byte-compile ./test/*.el

help: ## ヘルプを表示する
	@echo Emacs is best editor!
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
