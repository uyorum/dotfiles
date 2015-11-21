(el-get-bundle! point-undo)

;; 以前のカーソル位置に戻る
(define-key global-map (kbd "<f7>") 'point-undo)
(define-key global-map (kbd "S-<f7>") 'point-redo)
