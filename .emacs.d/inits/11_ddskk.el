(el-get-bundle! skk-autoloads in ddskk)

;; dired-x をロードした場合，C-xC-jにskk-modeをバインドしなおす
(when (require 'dired-x nil t)
  (global-set-key (kbd "C-x C-j") 'skk-mode))
(global-set-key (kbd "C-x C-j") 'skk-mode)
(global-set-key (kbd "C-x j") 'skk-mode)
;; 辞書サーバを使う
(setq skk-server-host "localhost")
(setq skk-server-portnum 1178)

;; SKK辞書サーバの起動
(setq skk-large-jisyo (locate-user-emacs-file "SKK-JISYO.L"))
(cond ((eq system-type 'windows-nt)
       (setq skk-server-prog (concat BIN "/skkserv-google.exe"))
       (setq skk-large-jisyo (replace-regexp-in-string "/" "\\\\" skk-large-jisyo)))
      ((eq system-type 'gnu/linux)
       (setq skk-server-prog (concat BIN "/skkserv-google-linux")))
      ((eq system-type 'darwin)
       (setq skk-server-prog (concat BIN "/skkserv-google-osx"))))
;; 非同期で実行するため関数を自作
(defun my:skk-boot-server ()
  "Start SKK server."
  (unless (get-buffer-process "*goskk*")
    (async-shell-command
     (mapconcat 'identity
                (list skk-server-prog "-v" "-p" (int-to-string skk-server-portnum) skk-large-jisyo) " ")
     (get-buffer-create "*goskk*"))))
(defun my:skk-close-server ()
  (interactive)
  (when (get-buffer-process "*goskk*")
    (skk-disconnect-server)
    (kill-process (get-buffer-process "*goskk*"))
    (message "Server disconnected")))
(defun my:launch-skk-server ()
  "Start SKK server and configure for using it"
  (my:skk-boot-server)
  (remove-hook 'kill-emacs-hook 'skk-disconnect-server)
  (add-hook 'kill-emacs-hook 'my:skk-close-server)
  (setq skk-server-inhibit-startup-server nil))

;; Sticky Shift
(setq skk-sticky-key ";")
;; 動的自動補完機能
(setq skk-dcomp-activate t)
;; 閉じ括弧の自動入力
(setq skk-auto-insert-paren t)
;; 見出し語と送り仮名がマッチした候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)
;; 句読点の設定，．
;; http://d.hatena.ne.jp/Rion778/20090617/1245212154
(setq-default skk-kutouten-type 'en)
;; コード中では自動で日本語入力をオフ
;; http://mugijiru.seesaa.net/article/201540864.html
(add-hook 'skk-load-hook
    (lambda ()
      (require 'context-skk)))
