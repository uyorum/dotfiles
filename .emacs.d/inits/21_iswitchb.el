(iswitchb-mode 1)
;; バッファ読み取り関数を iswitchb にする
(setq read-buffer-function 'iswitchb-read-buffer)
;; 部分文字列の代わりに正規表現を使う場合は t に設定する
(setq iswitchb-regexp nil)
;; 新しいバッファを作成するときにいちいち聞いてこない
(setq iswitchb-prompt-newbuffer nil)
;; ido.el
(ido-mode 1)                            ;コマンドが ido のものに置き換わる
(ido-everywhere 1)                      ;バッファ名，ファイル名入力すべてが ido に置き換わる
