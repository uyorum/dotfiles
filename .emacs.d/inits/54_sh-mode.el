(add-to-list 'auto-mode-alist '("\\.sh$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bash$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zsh$" . sh-mode))

(defun set-sh-mode-indentation ()
    (interactive)
    (setq sh-basic-offset 2
          sh-indentation 2))
(add-hook 'sh-mode-hook 'set-sh-mode-indentation)
