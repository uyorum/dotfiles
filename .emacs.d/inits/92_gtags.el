(el-get-bundle! gtags)
(el-get-bundle! helm-gtags)

(add-hook 'ruby-mode-hook 'helm-gtags-mode)
(add-hook 'go-mode-hook 'helm-gtags-mode)

;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-unset-key (kbd "M-t"))
             (local-unset-key (kbd "M-r"))
             (local-unset-key (kbd "M-s"))
             (local-unset-key (kbd "M-e"))
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             (local-set-key (kbd "M-e") 'helm-gtags-pop-stack)))
