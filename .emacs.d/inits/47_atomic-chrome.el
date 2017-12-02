(el-get-bundle websocket)
(el-get-bundle! alpha22jp/atomic-chrome)

(setq atomic-chrome-default-major-mode 'gfm-mode)
(setq atomic-chrome-buffer-open-style 'full)
(atomic-chrome-start-server)
