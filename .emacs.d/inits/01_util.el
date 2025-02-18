;; スタートアップメッセージを表示しない
(setq inhibit-startup-message t)

;; 自動で作成される各種ファイルは端末毎に保持する
(defvar my:dir-dot-emacs-local (concat HOME "/.emacs.local/"))
(unless (file-directory-p my:dir-dot-emacs-local)
  (make-directory my:dir-dot-emacs-local))

;; バックアップとオートセーブファイルを ~/.backups/ へ集める
;; http://dan-project.log.so-net.ne.jp/2012-06-04
(defvar my:auto-save-file-dir (concat HOME "/.backups/"))
(unless (file-directory-p my:auto-save-file-dir)
  (make-directory my:auto-save-file-dir))
;; バックアップファイル(<filename>~)
(setq backup-directory-alist `((".*" . ,(expand-file-name my:auto-save-file-dir))))
;; オートセーブファイル(#<filename>#)
(setq auto-save-file-name-transforms `((".*" ,(expand-file-name my:auto-save-file-dir) t)))
;; オートセーブファイルのリスト
(setq auto-save-list-file-prefix (concat my:auto-save-file-dir "auto-save-list/saves-"))
;; ロックファイルは場所変更の方法がわからないため作成しないようにする
(setq create-lockfiles nil)

;; M-x customize-variables や外部パッケージによるカスタム変数
;; 端末ごとの固有の設定もここに書く
(setq custom-file (concat my:dir-dot-emacs-local "custom.el"))

;; auto save and restore scratch buffer
(defvar my:scratch-save-file (concat my:dir-dot-emacs-local "scratch"))
(defun save-scratch-data ()
  (let ((str (progn
               (set-buffer (get-buffer "*scratch*"))
               (buffer-substring-no-properties
                (point-min) (point-max)))))
    (if (get-file-buffer (expand-file-name my:scratch-save-file))
        (setq buf (get-file-buffer (expand-file-name my:scratch-save-file)))
      (setq buf (find-file-noselect my:scratch-save-file)))
    (set-buffer buf)
    (erase-buffer)
    (insert str)
    (save-buffer)
    (kill-buffer buf)))
(defadvice save-buffers-kill-emacs
  (before save-scratch-buffer activate)
  (save-scratch-data))

(defun read-scratch-data ()
  (when (file-exists-p my:scratch-save-file)
    (set-buffer (get-buffer "*scratch*"))
    (erase-buffer)
    (insert-file-contents my:scratch-save-file)))
(read-scratch-data)

;; 起動直後のfind-fileのパス
(cd HOME)

;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)
;; デフォルトのインデント幅
(setq default-tab-width 2)
;; json
(setq js-indent-level 2)
;; CSS
(setq css-indent-offset 2)

;; yes/no ではなく y/n で質問に答える
(defalias 'yes-or-no-p 'y-or-n-p)

;; clipboard を X11/Windows のものと同期
;; Macは別ファイルで設定
(setq x-select-enable-clipboard t)

;; C-h は後退に割り当てる
;; (global-set-key (kbd "C-h") 'delete-backward-char)
;; 上の方法だとi-search中などで反映されない
(define-key key-translation-map [?\C-h] [?\C-?])

;; C-m にnewline-and-indentを割り当てる
(global-set-key (kbd "C-m") 'newline-and-indent)

(defun openline-and-indent ()
  "Insert a new line and indent"
  (interactive)
  (newline-and-indent)
  (previous-line)
  (indent-according-to-mode)
  (end-of-line nil))
(global-set-key (kbd "C-o") 'openline-and-indent)

(defun backward-kill-word-or-kill-region ()
  (interactive)
  (if (or (not transient-mark-mode) (region-active-p))
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))
(global-set-key (kbd "C-w") 'backward-kill-word-or-kill-region)

;; ファイル内のカーソル位置を記憶
(require 'saveplace)
(setq save-place-file (concat my:dir-dot-emacs-local "saved-places"))
;; for Emacs 25+
(save-place-mode 1)
;; for Emacs 24
(setq-default save-place t)

;; シンボリックリンクを辿る
(setq vc-follow-symlinks t)

;; cua-mode の設定
;; 矩形編集が楽
(cua-mode t)                            ;cua-mode をオン
(setq cua-enable-cua-keys nil)          ;CUAキーバインドを無効にする

;; windmove
(windmove-default-keybindings)
;; 反対側のウィンドウにいけるように
(setq windmove-wrap-around t)
;; C-M-{h,j,k,l}でウィンドウ間を移動
(global-set-key (kbd "C-M-k") 'windmove-up)
(global-set-key (kbd "C-M-j") 'windmove-down)
(global-set-key (kbd "C-M-l") 'windmove-right)
(global-set-key (kbd "C-M-h") 'windmove-left)

;; resizing window
(global-set-key (kbd "S-C-h") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-l") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-j") 'shrink-window)
(global-set-key (kbd "S-C-k") 'enlarge-window)

;; 現在位置のファイル，URL を開く
(ffap-bindings)

;; 行末の空白を削除
;; いくつかの拡張子では無効にする
(defvar my:delete-trailing-whitespace-exclude-suffix
  (list "\\.rd$" "\\.md$" "\\.rbt$" "\\.rab$"))
(defun my:delete-trailing-whitespace ()
  (interactive)
  (cond
   ((equal nil
           (loop for pattern in my:delete-trailing-whitespace-exclude-suffix
                 thereis (string-match pattern buffer-file-name)))
    (delete-trailing-whitespace))))

;; hook追加/削除のトグル関数とモードラインで現在の状態表示
;; http://syohex.hatenablog.com/entry/20130617/1371480584
(defvar my:current-delete-trail-state "")
(setq-default mode-line-format
              (cons '(:eval my:current-delete-trail-state)
                    mode-line-format))
(defun my:toggle-delete-trail ()
  (interactive)
  (cond ((memq 'my:delete-trailing-whitespace before-save-hook)
         (setq my:current-delete-trail-state
               (propertize "[D-]" 'face '((:foreground "blue" :weight bold))))
         (remove-hook 'before-save-hook 'my:delete-trailing-whitespace))
        (t
         (setq my:current-delete-trail-state "")
         (add-hook 'before-save-hook 'my:delete-trailing-whitespace)))
  (force-mode-line-update))
;; (add-hook 'before-save-hook 'my:delete-trailing-whitespace)))
(my:toggle-delete-trail)

;; バッファ全体をインデント
(defun my:indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(setq-default show-trailing-whitespace t)

;; 閉じ括弧を自動で入力
(electric-pair-mode 1)

;; 行番号を表示する
(global-linum-mode t)
;; 3桁分のマージンをとる
(setq linum-format "%3d")

;; ファイルが #! から始まる場合，+x を付けて保存する
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; カーソル移動によるスクロール時にカーソルを中央に移動しない
(setq scroll-conservatively 1)
;; 残り10行でスクロールする
(setq scroll-margin 10)
;; scroll-up/scroll-down時にカーソル位置を保持する
(setq scroll-preserve-screen-position t)
