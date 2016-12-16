;; スタートアップメッセージを表示しない
(setq inhibit-startup-message t)

;; 自動で作成される各種ファイルは端末毎に保持する
(defvar my:dir-dot-emacs-local (concat HOME "/.emacs.local/"))
(unless (file-directory-p my:dir-dot-emacs-local)
  (make-directory my:dir-dot-emacs-local))

;; auto-complete
(setq ac-comphist-file (concat my:dir-dot-emacs-local "ac-comphist.dat"))

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

;;; auto save and restore scratch buffer
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
(global-set-key (kbd "C-h") 'delete-backward-char)

;; C-m にnewline-and-indentを割り当てる
(global-set-key (kbd "C-m") 'newline-and-indent)

;; ファイル内のカーソル位置を記憶
(setq-default save-place t)
(setq save-place-file (concat my:dir-dot-emacs-local "/saved-places"))
(require 'saveplace)

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
(define-key global-map (kbd "C-M-k") 'windmove-up)
(define-key global-map (kbd "C-M-j") 'windmove-down)
(define-key global-map (kbd "C-M-l") 'windmove-right)
(define-key global-map (kbd "C-M-h") 'windmove-left)

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
(add-hook 'before-save-hook 'my:delete-trailing-whitespace)

;; 閉じ括弧を自動で入力
(electric-pair-mode 1)

;; 行番号を表示する
(global-linum-mode t)
