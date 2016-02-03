(el-get-bundle! jinzhu/zeal-at-point)

(global-set-key (kbd "C-c d") 'zeal-at-point)

(add-to-list 'zeal-at-point-mode-alist '(python-mode . "python"))
(add-to-list 'zeal-at-point-mode-alist '(ruby-mode . "ruby"))
(add-to-list 'zeal-at-point-mode-alist '(go-mode . "go"))
(add-to-list 'zeal-at-point-mode-alist '(shell-script-mode . "bash"))
