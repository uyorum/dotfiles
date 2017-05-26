(el-get-bundle! projectile)

(setq projectile-enable-caching t)
(setq projectile-cache-file (concat my:dir-dot-emacs-local "projectile.cache"))

(setq projectile-known-projects-file (concat my:dir-dot-emacs-local "projectile-bookmarks.eld"))

(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)

;; functions
(defun my:projectile-file-in-dir-p (file)
  (string-prefix-p find-dir file))

(defun my:projectile-file-in-dir (dir)
  (let ((find-dir dir))
    (cl-remove-if-not 'my:projectile-file-in-dir-p (projectile-current-project-files))))

;; 指定したパスで始まるファイルを探す
(defun my:projectile-find-file-in-dir (dir &optional arg)
  (interactive "P")
  (projectile-maybe-invalidate-cache arg)
  (let ((file (projectile-completing-read (concat "Find file from " dir ": ")
                                          (my:projectile-file-in-dir dir))))
    (find-file (expand-file-name file (projectile-project-root)))))
