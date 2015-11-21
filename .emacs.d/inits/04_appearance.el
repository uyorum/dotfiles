;; tool bar/menu bar非表示
(tool-bar-mode 0)
(menu-bar-mode 0)

;; モードラインに時刻を表示
(display-time)

;; カーソルの点滅を止める
;; (blink-cursor-mode 0)

;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; 現在行に色をつける
;(global-hl-line-mode 1)
;; 色の変更
;(set-face-background 'hl-line "darkolivegreen")
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
;; (cancel-timer global-hl-line-timer)

;; フォントの設定
(set-face-attribute 'default nil :font "源ノ角ゴシック Code JP R" :height 70)
(add-to-list 'default-frame-alist '(font . "源ノ角ゴシック Code JP R-10"))

;; 半角と全角の比を1:2に
(add-to-list 'face-font-rescale-alist
             '(".*Code JP.*" . 1.2))

;; Color theme
(el-get-bundle! color-theme-solarized)

;; 背景色の設定
;; http://d.hatena.ne.jp/kei10in/20101101/1288617632
(custom-set-faces
 '(default ((t
             (:background "black" :foreground "#55FF55")
             )))
 '(cursor ((((class color)
             (background dark))
            (:background "#00AA00")))
          (((class color)
            (background light))
           (:background "#999999"))
          (t ())
          ))

;; 種類ごとの色
;(add-hook 'font-lock-mode-hook
;  '(lambda ()
;    ;(set-face-foreground 'font-lock-comment-face "chocolate1")
;    (set-face-foreground 'font-lock-comment-face "#f69933")  ; 微調整
;    (set-face-foreground 'font-lock-string-face "LightSalmon")
;    ;(set-face-foreground 'font-lock-keyword-face "Cyan1")
;    (set-face-foreground 'font-lock-keyword-face "#66e6e6")  ; 微調整
;    (set-face-foreground 'font-lock-builtin-face "LightSteelBlue")
;    (set-face-foreground 'font-lock-function-name-face "LightSkyBlue")
;    (set-face-foreground 'font-lock-variable-name-face "LightGoldenrod")
;    (set-face-foreground 'font-lock-type-face "PaleGreen")
;    (set-face-foreground 'font-lock-constant-face "Aquamarine")
;    (set-face-foreground 'font-lock-warning-face "Pink")
;  )
;)

;; paren-mode : 対応する括弧を強調して表示する
(setq show-paren-dely 0)                ;表示までの秒数．初期値は0.125
(show-paren-mode t)                     ;有効化
;; paren のスタイル : expression は括弧内も強調表示
;; (setq show-paren-style 'expression)
;; (setq show-paren-style 'mixed)
(setq show-paren-style 'parenthesis)

;; 文字の折り返し
;; http://www.bookshelf.jp/soft/meadow_15.html#SEC132
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

(require 'uniquify)
;;  filename<dix> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; * で囲まれたバッファ名は対象外にする
(setq uniquify-ignore-buffers-re "*[^*]+*")
