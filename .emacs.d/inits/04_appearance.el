;; tool bar/menu bar非表示
(tool-bar-mode 0)
(menu-bar-mode 0)

;; モードラインに時刻を表示
(display-time)

;; 起動時のフレームサイズ，位置を記憶
(defvar my:frame-parameters-file (concat my:dir-dot-emacs-local "frame-parameter"))
(defun save-frame-size ()
  (interactive)
  (let* ((param (frame-parameters (selected-frame)))
         (current-height (frame-height))
         (current-width (frame-width))
         (current-top-margin (if (integerp (cdr (assoc 'top param)))
                                 (cdr (assoc 'top param))
                                 0))
         (current-left-margin (if (integerp (cdr (assoc 'left param)))
                                  (cdr (assoc 'left param))
                                  0))
         (buf nil)
         (file my:frame-parameters-file)
         )
    (unless (setq buf (get-file-buffer (expand-file-name file)))
      (setq buf (find-file-noselect (expand-file-name file))))
    (set-buffer buf)
    (erase-buffer)
    (insert (concat
             "(set-frame-size (selected-frame) "(int-to-string current-width)" "(int-to-string current-height)")\n"
             "(set-frame-position (selected-frame) "(int-to-string current-left-margin)" "(int-to-string current-top-margin)")\n"
             ))
    (save-buffer)))
(when window-system
  (add-hook 'kill-emacs-hook 'save-frame-size))

(defun load-frame-size ()
  (interactive)
  (let ((file my:frame-parameters-file))
    (when (file-exists-p file)
      (load-file file))))
(when window-system (load-frame-size))

;; カーソルの点滅を止める
;; (blink-cursor-mode 0)

;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; 現在行に色をつける
;;(global-hl-line-mode 1)
;; 色の変更
;;(set-face-background 'hl-line "darkolivegreen")
;; 現在行をアンダーラインで強調
(setq hl-line-face 'underline)
;; 動作が重くなるのを防ぐ
(require 'hl-line)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
    (global-hl-line-highlight)))
(setq global-hl-line-timer
      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))
;;(cancel-timer global-hl-line-timer)

;; フォントの設定
(set-face-attribute 'default nil :family "Source Han Code JP" :height 120)

;; Color theme
(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(el-get-bundle color-theme-solarized)
(load-theme 'solarized t)
(setq solarized-termcolors 256)

;; paren-mode : 対応する括弧を強調して表示する
(setq show-paren-dely 0)                ;表示までの秒数．初期値は0.125
(show-paren-mode t)                     ;有効化
;; paren のスタイル : expression は括弧内も強調表示
;; (setq show-paren-style 'expression)
(setq show-paren-style 'mixed)
;;(setq show-paren-style 'parenthesis)

;; 文字の折り返し
;; http://www.bookshelf.jp/soft/meadow_15.html#SEC132
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

(require 'uniquify)
;;  filename<dix> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; * で囲まれたバッファ名は対象外にする
(setq uniquify-ignore-buffers-re "*[^*]+*")

(el-get-bundle! highlight-indentation)
(add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)
(set-face-background 'highlight-indentation-current-column-face "#073642")
