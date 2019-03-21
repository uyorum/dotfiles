(el-get-bundle! markdown-mode)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.tmp\\'" . gfm-mode))
(defvar my:pandoc-css-path (concat "file:///" user-emacs-directory "css/github.css"))
(setq markdown-command
      (concat
       "pandoc -f markdown_github-hard_line_breaks+raw_html+fenced_code_attributes -s -t html5 -c "
       my:pandoc-css-path))
(setq markdown-indent-on-enter nil)
(add-hook 'markdown-mode-hook 'skk-mode)

(define-key markdown-mode-map (kbd "C-c [")
  (lambda ()
    (interactive)
    (insert "[ ] ")))
