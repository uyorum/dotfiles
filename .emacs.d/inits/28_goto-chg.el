(el-get-bundle! goto-chg)

;; 最後の変更箇所に移動する
(global-set-key (kbd "<f8>") 'goto-last-change)
(global-set-key (kbd "S-<f8>") 'goto-last-change-reverse)
