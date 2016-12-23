(el-get-bundle! redo+)

(global-set-key (kbd "C-M-/") 'redo)

;; 過去のundoがredoされないようにする
(setq undo-no-redo t)

;; 大量のundoに耐えられるようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)
