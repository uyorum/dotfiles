;; Use ruby-mode
(el-get-bundle! flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(el-get-bundle! rspec-mode)
;; load snippets by yasnippet
(eval-after-load 'rspec-mode '(rspec-install-snippets))
