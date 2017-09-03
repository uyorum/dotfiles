(el-get-bundle! yasnippet)

(setq yas-snippet-dirs (concat user-emacs-directory "snippets"))
(yas-global-mode 1)

(define-key yas-minor-mode-map (kbd "C-c s n") 'yas-new-snippet)
(define-key yas-minor-mode-map (kbd "C-c s i") 'yas-insert-snippet)
(define-key yas-minor-mode-map (kbd "C-c s v") 'yas-visit-snippet-file)
(define-key yas-minor-mode-map (kbd "C-c s d") 'yas-describe-table)
(define-key yas-minor-mode-map (kbd "C-c s l") 'yas-reload-all)
