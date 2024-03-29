(el-get-bundle! go-mode)
(el-get-bundle! go-flymake)
(el-get-bundle! go-autocomplete)
(el-get-bundle! golint in go-lint)

;; need some go libraries
;; `go get -u github.com/dougm/goflymake`
;; `go get -u github.com/nsf/gocode`
;; `go get -u golang.org/x/tools/cmd/goimports`
;; `go get -u github.com/golang/lint`

(define-key go-mode-map (kbd "C-c C-d") 'godoc)

;; run gofmt before save
(add-hook 'before-save-hook 'gofmt-before-save)

;; run goimports instead of gofmt
;; auto import packages
(setq gofmt-command "goimports")
