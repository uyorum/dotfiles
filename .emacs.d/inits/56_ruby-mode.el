(el-get-bundle! Enhanced-Ruby-Mode)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))

(el-get-bundle! flymake-ruby)
(add-hook 'enh-ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(el-get-bundle! rspec-mode)
;; load snippets by yasnippet
(add-hook 'enh-ruby-mode-hook 'rspec-mode)
(eval-after-load 'rspec-mode '(rspec-install-snippets))
