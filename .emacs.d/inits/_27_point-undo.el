(el-get-bundle! emacswiki:point-undo)

;; 以前のカーソル位置に戻る
(global-set-key (kbd "<f7>") 'point-undo)
(global-set-key (kbd "S-<f7>") 'point-redo)
