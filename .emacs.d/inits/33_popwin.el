(el-get-bundle! popwin)

;; direx:direx-modeのバッファをウィンドウ左辺に幅25でポップアップ
;; :dedicatedにtを指定することで、direxウィンドウ内でのバッファの切り替えがポップアップ前のウィンドウに移譲される
(setq display-buffer-function 'popwin:display-buffer)
(push '(direx:direx-mode :position left :width 25 :dedicated t) popwin:special-display-config)
