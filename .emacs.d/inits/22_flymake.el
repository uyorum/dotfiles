(require 'flymake)
(el-get-bundle! flymake-cursor in illusori/emacs-flymake-cursor)
(setq flymake-cursor-error-display-delay 0.9)
(setq flymake-cursor-number-of-errors-to-display 1)
(setq flymake-cursor-auto-enable t)

(el-get-bundle! flymake-ruby)
(el-get-bundle! go-flymake)
