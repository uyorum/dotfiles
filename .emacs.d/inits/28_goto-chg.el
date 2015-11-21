(el-get-bundle! goto-chg)

;; 最後の変更箇所に移動する
(define-key global-map (kbd "<f8>") 'goto-last-change)
(define-key global-map (kbd "S-<f8>") 'goto-last-change-reverse)
