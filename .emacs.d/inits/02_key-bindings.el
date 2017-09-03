(global-unset-key (kbd "C-c"))
(global-unset-key (kbd "C-t"))

(global-set-key (kbd "C-c i") 'imenu)

(global-unset-key (kbd "C-M-\\"))
(global-set-key (kbd "C-c /") 'indent-region)
(global-set-key (kbd "C-c \\") 'my:indent-buffer)
