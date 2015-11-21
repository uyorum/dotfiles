(el-get-bundle recentf-ext)

(require 'recentf)
;; ファイルの場所を変更
(setq recentf-save-file (concat my:dir-dot-emacs-local "recentf"))
(recentf-load-list)
;; メニューに表示するファイルの個数
(setq recentf-max-menu-items 20)
;; 記憶するファイルの個数
(setq recentf-max-saved-items 3000)
;; 最近使ったファイルに加えないファイルを正規表現で指定する
(setq recentf-exclude
      '("/$"
        "/[Tt]mp/"
        "/[Tt]emp/"
        "/.git/"
        "/.emacs.d/elpa/"
        "/.emacs.d/el-get/"
        "/howm-keys$"
        "/recentf$"))
;; 保存する内容を整理しない
;(setq recentf-auto-cleanup 'never)
;; 30秒ごとに recentf を保存
(run-with-idle-timer 30 t 'recentf-save-list)

(require 'recentf-ext)
