(el-get-bundle! helm-ag)

(setq helm-ag-base-command "rg --vimgrep --no-heading")
;; 現在のシンボルをデフォルトのクエリにする
(setq helm-ag-insert-at-point 'symbol)

(global-set-key (kbd "C-M-g") 'helm-ag)

(defun helm-projectile-ag ()
  (interactive)
  (helm-ag (projectile-project-root)))
(global-set-key (kbd "C-M-f") 'helm-projectile-ag)
