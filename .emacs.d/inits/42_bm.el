(el-get-bundle! bm)

(setq bm-repository-file (concat my:dir-dot-emacs-local "bm-repository"))
(setq-default bm-buffer-persistence t)
(setq bm-restore-repository-on-load t)
(add-hook' after-init-hook 'bm-repository-load)
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'kill-emacs-hook '(lambda ()
                              (bm-buffer-save-all)
                              (bm-repository-save)))

(key-chord-define-global "bj" 'bm-toggle)
(key-chord-define-global "bn" 'bm-next)
(key-chord-define-global "bp" 'bm-previous)

(el-get-bundle! s)
(el-get-bundle! yasuyk/helm-bm)
(push '(migemo) helm-source-bm)
(setq helm-source-bm (delete '(multiline) helm-source-bm))
(key-chord-define-global "bh" 'helm-bm)
