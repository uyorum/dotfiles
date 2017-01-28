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
(defvar my:projectile-find-prefix-views "app/views/")
(defvar my:projectile-find-prefix-controllers "app/controllers/")
(defvar my:projectile-find-prefix-models "app/models/")
(defvar my:projectile-find-prefix-helpers "app/helpers/")
(defvar my:projectile-find-prefix-spec "spec/")
(defvar my:projectile-find-prefix-test "test/")

(defun my:projectile-find-views ()
  (interactive)
  (my:projectile-find-file-in-dir my:projectile-find-prefix-views))
(defun my:projectile-find-controllers ()
  (interactive)
  (my:projectile-find-file-in-dir my:projectile-find-prefix-controllers))
(defun my:projectile-find-models ()
  (interactive)
  (my:projectile-find-file-in-dir my:projectile-find-prefix-models))
(defun my:projectile-find-helpers ()
  (interactive)
  (my:projectile-find-file-in-dir my:projectile-find-prefix-helpers))
(defun my:projectile-find-spec ()
  (interactive)
  (my:projectile-find-file-in-dir my:projectile-find-prefix-spec))
(defun my:projectile-find-test ()
  (interactive)
  (my:projectile-find-file-in-dir my:projectile-find-prefix-test))

(global-set-key (kbd "C-c r v") 'my:projectile-find-views)
(global-set-key (kbd "C-c r m") 'my:projectile-find-controllers)
(global-set-key (kbd "C-c r c") 'my:projectile-find-models)
(global-set-key (kbd "C-c r h") 'my:projectile-find-helpers)
(global-set-key (kbd "C-c r s") 'my:projectile-find-spec)
(global-set-key (kbd "C-c r t") 'my:projectile-find-test)

;; 現在のControllerに対応するViewディレクトリを開く
(defun my:projectile-find-views-from-controllers ()
  (interactive)
  (let ((my:dir (replace-regexp-in-string
                 "_controller\.rb" "\/"
                 (replace-regexp-in-string
                  ".*\/app\/controllers" "app\/views"
                  (buffer-file-name)))))
    (my:projectile-find-file-in-dir my:dir)))
(global-set-key (kbd "C-c r V") 'my:projectile-find-views-from-controllers)
