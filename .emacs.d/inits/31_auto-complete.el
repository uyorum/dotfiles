(el-get-bundle! auto-complete-config in auto-complete)

(global-auto-complete-mode 1)
;; emacs-lisp-mode でEmacs Lisp シンボルも補完
(defun emacs-lisp-ac-setup ()
  (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-symbols)))
(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-ac-setup)
