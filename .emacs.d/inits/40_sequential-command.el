(el-get-bundle! sequential-command)
(el-get-bundle! emacswiki:sequential-command-config)

(sequential-command-setup-keys)

;; インデントを除いた行頭に移動
(defun beginning-of-code ()
  (interactive)
  (beginning-of-line)
  (skip-syntax-forward " " (line-end-position)))
(define-sequential-command seq-home
  beginning-of-code beginning-of-line beginning-of-buffer seq-return)

(global-set-key (kbd "C-a") 'seq-home)
