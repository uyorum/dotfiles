(el-get-bundle! key-chord)

;; 同時押しの許容誤差
(setq key-chord-two-keys-delay 0.06)
(key-chord-mode 1)
;; rf: recentf-open-files
(key-chord-define-global "rf" 'recentf-open-files)
;; jk: toggle view-mode
(key-chord-define-global "jk" 'view-mode)
;; kc: toggle key chord
(key-chord-define-global "kc" 'key-chord-mode)
