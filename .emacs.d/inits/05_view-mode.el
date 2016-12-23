(setq view-read-only t)
(require 'view)

;; vi 感覚の操作
(define-key view-mode-map (kbd "h") 'backward-char)
(define-key view-mode-map (kbd "j") 'next-line)
(define-key view-mode-map (kbd "k") 'previous-line)
(define-key view-mode-map (kbd "l") 'forward-char)
(define-key view-mode-map (kbd "\C-f") 'scroll-up-command)
(define-key view-mode-map (kbd "\C-b") 'scroll-down-command)
(define-key view-mode-map (kbd "$") 'end-of-line)
;; 書き込み不能なファイルで view-mode から抜けなくする
;; エラーが出るためコメントアウトしておく
;;(viewer-stay-in-setup)
