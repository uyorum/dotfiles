(el-get-bundle! key-chord)

;; 同時押しの許容誤差
(setq key-chord-two-keys-delay 0.02)
(key-chord-mode 1)
;; rf: recentf-open-files
(key-chord-define-global "rf" 'recentf-open-files)
;; jk: toggle view-mode
(key-chord-define-global "jk" 'view-mode)
