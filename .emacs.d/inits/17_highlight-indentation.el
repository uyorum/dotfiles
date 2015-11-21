(el-get-bundle! highlight-indentation)

(setq highlight-indentation-offset 2)  ;; default: 4
(set-face-background 'highlight-indentation-face "#5c5c5c")
(set-face-background 'highlight-indentation-current-column-face "#5c5c5c")

(add-hook 'ruby-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'gfm-mode-hook  'highlight-indentation-current-column-mode)
(add-hook 'markdown-mode-hook  'highlight-indentation-current-column-mode)
