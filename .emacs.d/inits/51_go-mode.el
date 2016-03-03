(el-get-bundle! go-mode)
(el-get-bundle! go-flymake)

;; need to install gocode
;; `go get -u github.com/nsf/gocode`
(el-get-bundle! go-autocomplete)

(add-hook 'go-mode-hook
          '(lambda()
             (setq c-basic-offset 4)
             (setq indent-tabs-mode t)
             (local-set-key (kbd "M-.") 'godef-jump)
             (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
             (local-set-key (kbd "C-c i") 'go-goto-imports)
             (local-set-key (kbd "C-c d") 'godoc)))

;; run gofmt before save
(add-hook 'before-save-hook 'gofmt-before-save)
;; auto import packages
(setq gofmt-command "goimports")
