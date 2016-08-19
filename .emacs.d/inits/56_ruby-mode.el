(require 'ruby-mode)

;; Don't insert magic comment
(defun ruby-mode-set-encoding () nil)

(el-get-bundle! flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(el-get-bundle! rspec-mode)
;; load snippets by yasnippet
(eval-after-load 'rspec-mode '(rspec-install-snippets))
