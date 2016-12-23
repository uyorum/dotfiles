;; Emacs serverとして起動する
(require 'server)
;; Windows用認証ファイルの場所
;; emacscllient側は環境変数で設定
(setq server-auth-dir my:dir-dot-emacs-local)
;; 前回異常終了した場合は認証ファイルが残ってしまうため先に削除しておく
(server-force-delete)
(unless (server-running-p)
  (server-start))
;; 編集が終了したらEmacsを最小化する
;;(defun iconify-emacs-when-server-is-done ()
;;  (unless server-clients (iconify-frame)))
;;(add-hook 'server-done-hook 'iconify-emacs-when-server-is-done)
;; C-x C-c にemacsclient終了を割り当てる
(global-set-key (kbd "C-x C-c") 'server-edit)
;; emacsclient -nwで起動した場合はC-x C-zで終了する
(global-unset-key (kbd "C-x C-z"))
(global-set-key (kbd "C-x C-z") 'delete-frame)
;; M-x exitでEamcsを終了できるようにする
(defalias 'exit 'save-buffers-kill-emacs)
