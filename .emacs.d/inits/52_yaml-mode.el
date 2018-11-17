(el-get-bundle! yaml-mode)

(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-hook 'yaml-mode-hook 'highlight-indentation-current-column-mode)
