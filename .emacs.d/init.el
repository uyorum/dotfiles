(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(setq el-get-dir (concat user-emacs-directory "el-get/"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(package-initialize)

;; el-getでインストールするelispのバージョンを固定する
(el-get-bundle! tarao/el-get-lock)
;; Windowsでel-get.lockの改行コードがCRLFになるのを防ぐ
(set-default-coding-systems 'utf-8-unix)
;; 特定のパッケージのバージョンをロック
;;(el-get-lock 'magit)

;; init-loader
(el-get-bundle! init-loader)
;; confファイル読み込み時にバイトコンパイル
;; 設定の一時的な有効/無効が面倒なため無効にしておく
;(setq init-loader-byte-compile 1)
;; エラー時のみログ出力
(setq init-loader-show-log-after-init 'error-only)
(defvar my:init-loader-inits-dir (concat user-emacs-directory "inits"))
(unless (file-directory-p my:init-loader-inits-dir)
  (make-directory my:init-loader-inits-dir))
(init-loader-load my:init-loader-inits-dir)

;; initsの採番規則
;; 00 - 10 built-in functions
;; 11 - 50 installed elisp
;; 51 - 70 program languages
;; 71 -    etc.
