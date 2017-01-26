(el-get-bundle! auto-complete-config in auto-complete)

(setq ac-comphist-file (concat my:dir-dot-emacs-local "ac-comphist.dat"))

(global-auto-complete-mode t)
;; emacs-lisp-mode でEmacs Lisp シンボルも補完
(defun emacs-lisp-ac-setup ()
  (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-symbols)))
(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-ac-setup)

;; 自動で補完を開始しない
(setq ac-auto-start nil)
;; 補完を開始するキー
(ac-set-trigger-key "TAB")
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;; 一つしか候補がない時にTAB(ac-expand)すると補完を完了(ac-complete)する
;; 次候補/前候補を選んだ後にTAB(ac-expand)すると補完を完了(ac-complete)する
;; 補完後にメニューを自動的に非表示にする
(setq ac-dwim t)
