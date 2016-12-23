(el-get-bundle howm)

;; http://howm.sourceforge.jp/index-j.html
(setq howm-menu-lang 'ja)
(global-set-key (kbd "C-c , ,") 'howm-menu)
(autoload 'howm-menu "howm" "Hitori Otegaru Wiki Modoki" t)
;; 保存場所の変更
(setq howm-directory (concat HOME "/howm"))
(setq howm-history-file (concat my:dir-dot-emacs-local "howm-history"))
(setq howm-keyword-file (concat my:dir-dot-emacs-local "howm-keys"))
;; メニューを2時間キャッシュ
(setq howm-menu-expiry-hours 2)
;; markdown-modeと連携
(add-hook 'howm-mode 'gfm-mode)
(setq howm-view-title-header "#")
(setq howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.md")
(require 'howm)
;; howmメモを保存と同時に閉じる
(defun howm-save-buffer-and-kill ()
  "howmメモを保存と同時に閉じる"
  (interactive)
  (when (and (buffer-file-name)
             (string-match "\\.md" (buffer-file-name)))
    (save-buffer)
    (kill-buffer nil)))
;; C-c C-c C-cでメモの保存と同時にバッファを閉じる
(define-key howm-mode-map (kbd "C-c C-c C-c") 'howm-save-buffer-and-kill)
