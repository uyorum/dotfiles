(el-get-bundle! zlc)

;; ミニバッファでの補完をzshライクに
(let ((map minibuffer-local-map))
  (define-key map (kbd "<down>") 'zlc-select-next-vertical)
  (define-key map (kbd "<up>") 'zlc-select-previous-vertical)
  (define-key map (kbd "<right>") 'zlc-select-next)
  (define-key map (kbd "<left>") 'zlc-select-previous)
  (define-key map (kbd "C-p") 'zlc-select-previous-vertical)
  (define-key map (kbd "C-n") 'zlc-select-next-vertical)
  (define-key map (kbd "C-b") 'zlc-select-previous)
  (define-key map (kbd "C-f") 'zlc-select-next)
  (define-key map (kbd "C-d") 'zlc-reset))
(setq zlc-select-completion-immediately nil)
