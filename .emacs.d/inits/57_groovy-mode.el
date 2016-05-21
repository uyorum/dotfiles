(el-get-bundle groovy-emacs-mode)
(require 'groovy-mode)

(add-to-list 'auto-mode-alist '("\\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("Jenkinsfile$" . groovy-mode))
