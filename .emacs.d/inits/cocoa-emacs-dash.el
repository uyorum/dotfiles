(el-get-bundle! dash-at-point)

(global-set-key (kbd "C-c d") 'dash-at-point)

(add-to-list 'dash-at-point-mode-alist '(python-mode . "python"))
(add-to-list 'dash-at-point-mode-alist '(ruby-mode . "ruby"))
(add-to-list 'dash-at-point-mode-alist '(enh-ruby-mode . "ruby"))
(add-to-list 'dash-at-point-mode-alist '(go-mode . "go"))
(add-to-list 'dash-at-point-mode-alist '(shell-script-mode . "bash"))
(add-to-list 'dash-at-point-mode-alist '(emacs-lisp-mode . "elisp"))
