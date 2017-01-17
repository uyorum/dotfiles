(require 'ruby-mode)

;; Don't insert magic comment
(defun ruby-mode-set-encoding () nil)

(el-get-bundle! ruby-electric)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)
(add-hook 'ruby-mode-hook '(electric-pair-local-mode 0))

;; Flymake
(el-get-bundle! flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; Rspec
(el-get-bundle! rspec-mode)
;; load snippets by yasnippet
(eval-after-load 'rspec-mode '(rspec-install-snippets))

;; Ruby on Rails
;; installation of inflections via el-get fails
;;(el-get-bundle! inflections :type github :pkgname "eschulte/jump.el")
;;(el-get-bundle! projectile-rails)
;;(projectile-rails-global-mode)
