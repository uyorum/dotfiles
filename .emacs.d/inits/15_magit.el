(el-get-bundle dash)

(el-get-bundle! with-editor)
(setq with-editor-file-name-history-exclude nil)

(el-get-bundle! magit)
(setq magit-auto-revert-mode 1)

(global-set-key (kbd "C-c g s") 'magit-status)
(global-set-key (kbd "C-c g o") 'magit-checkout)
(global-set-key (kbd "C-c g p") 'magit-pull)
(global-set-key (kbd "C-c g P") 'magit-push)
(global-set-key (kbd "C-c g m") 'magit-merge)
(global-set-key (kbd "C-c g r") 'magit-cherry)
(global-set-key (kbd "C-c g l") 'magit-log-all)
(global-set-key (kbd "C-c g L") 'magit-log-all-branches)
