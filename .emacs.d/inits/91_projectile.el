(el-get-bundle! projectile)

(setq projectile-enable-caching t)
(setq projectile-cache-file (concat my:dir-dot-emacs-local "projectile.cache"))

(setq projectile-known-projects-file (concat my:dir-dot-emacs-local "projectile-bookmarks.eld"))

(projectile-global-mode)
(setq projectile-completion-system 'helm)
