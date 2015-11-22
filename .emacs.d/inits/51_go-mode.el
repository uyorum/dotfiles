(el-get-bundle! go-mode)

;; need to install gocode
;; `go get -u github.com/nsf/gocode`
(el-get-bundle! go-autocomplete)

;; run gofmt before save
(add-hook 'before-save-hook 'gofmt-before-save)

;; auto import packages
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
