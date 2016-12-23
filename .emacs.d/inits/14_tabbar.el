(el-get-bundle! tabbar)

;; これがないとcui版でエラーになってしまう
(setq mouse-wheel-mode nil)
(tabbar-mode 1)
;; タブ上でマウスホイールを使わない
(tabbar-mwheel-mode -1)

(global-set-key (kbd "C-t C-n") 'tabbar-forward-tab)
(global-set-key (kbd "C-t C-p") 'tabbar-backward-tab)
(global-set-key (kbd "C-t C-f") 'tabbar-forward-group)
(global-set-key (kbd "C-t C-b") 'tabbar-backward-group)

;;"*"で始まるバッファをタブとして表示しない
(defun my-tabbar-buffer-list ()
  (remove-if
   (lambda (buffer)
     (find (aref (buffer-name buffer) 0) " *"))
   (buffer-list)))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
