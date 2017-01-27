(require 'ruby-mode)

;; Don't insert magic comment
(defun ruby-mode-set-encoding () nil)

(el-get-bundle! ruby-electric)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (electric-pair-local-mode 0)
             (ruby-electric-mode t)))

;; Flymake
(el-get-bundle! flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; Rspec
(el-get-bundle! rspec-mode)
;; load snippets by yasnippet
(eval-after-load 'rspec-mode '(rspec-install-snippets))

;; Ruby on Rails
(global-set-key (kbd "C-c r v") '(lambda ()
                                   (interactive)
                                   (my:projectile-find-file-in-dir "app/views/")))
(global-set-key (kbd "C-c r m") '(lambda ()
                                   (interactive)
                                   (my:projectile-find-file-in-dir "app/models/")))
(global-set-key (kbd "C-c r c") '(lambda ()
                                   (interactive)
                                   (my:projectile-find-file-in-dir "app/controllers/")))
(global-set-key (kbd "C-c r h") '(lambda ()
                                   (interactive)
                                   (my:projectile-find-file-in-dir "app/helpers/")))
(global-set-key (kbd "C-c r s") '(lambda ()
                                   (interactive)
                                   (my:projectile-find-file-in-dir "spec/")))
(global-set-key (kbd "C-c r t") '(lambda ()
                                   (interactive)
                                   (my:projectile-find-file-in-dir "test/")))

;; 現在のControllerに対応するViewディレクトリを開く
(global-set-key (kbd "C-c r V") '(lambda ()
                                   (interactive)
                                   (let ((my:dir (replace-regexp-in-string
                                                  "_controller\.rb"
                                                  "\/"
                                                  (replace-regexp-in-string
                                                   ".*\/app\/controllers"
                                                   "app\/views"
                                                   (buffer-file-name)))))
                                     (my:projectile-find-file-in-dir my:dir))))
