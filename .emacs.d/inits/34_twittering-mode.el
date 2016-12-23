;;(el-get-bundle! twittering-mode)
(el-get-bundle! twittering-mode :type github :pkgname "hayamiz/twittering-mode")

(require 'epa-file)
(epa-file-enable)
;; Timeline format
;; Default: (setq twittering-status-format "%i %s,  %@:¥n  %t // from %f%L")
;; %s - screen_name
;; %S - name
;; %i - profile_image
;; %d - description
;; %l - location
;; %L - " [location]"
;; %u - url
;; %j - user.id
;; %p - protected?
;; %c - created_at (raw UTC string)
;; %C{time-format-str} - created_at (formatted with time-format-str)
;; %@ - X seconds ago
;; %t - text
;; %' - truncated
;; %f - source
;; %# - id
(setq twittering-status-format
      (concat
       ;; アイコン, 名前
       "%i%S@%s\n"
       ;; ツイート
       "%T\n"
       ;; 時刻
       "%@ "
       ;; Fav
       "%FACE[font-lock-warning-face]{%FIELD-IF-NONZERO[☆%d ]{favorite_count}}"
       ;; RT
       "%FACE[font-lock-warning-face]{%FIELD-IF-NONZERO[→%d]{retweet_count}}"))
(setq twittering-username "uyorum")
;; マスターパスワードを使用
(setq twittering-use-master-password t)
;; アイコン表示
(setq twittering-icon-mode t)
;; アイコンをローカルに保存
(setq twittering-use-icon-storage t)
;; アイコンサイズを変更
;; imagemagickが必要
;;(setq twittering-convert-fix-size 40)
;; 各種ファイルの場所を変更
(setq twittering-private-info-file (concat my:dir-dot-emacs-local "twittering-mode.gpg"))
(setq twittering-icon-storage-file (concat my:dir-dot-emacs-local "twittering-mode-icons.gz"))
;; 更新間隔(秒)
(setq twittering-timer-interval 60)
;; プロキシの設定
;;(setq twittering-proxy-use nil)
;;(setq twittering-proxy-server "127.0.0.1")
;;(setq twittering-proxy-port 8080)
;; "F"でお気に入り
;; "R"でリツイート
(define-key twittering-mode-map (kbd "F") 'twittering-favorite)
(define-key twittering-mode-map (kbd "R") 'twittering-native-retweet)
;; 証明書を検証しない
;; 一部の公衆無線LANを使うとき必要
;;(setq twittering-allow-insecure-server-cert t)
;; つぶやく時，ミニバッファではなくて通常のバッファがポップアップしてほしい場合はこれを加える
(setq twittering-update-status-function 'twittering-update-status-from-pop-up-buffer)

(add-hook 'twittering-edit-mode-hook 'skk-mode)
;;(add-hook 'twittering-mode-hook '(linum-mode 0))
