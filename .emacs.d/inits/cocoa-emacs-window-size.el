;; 起動時のサイズを指定
(if window-system (progn
  (setq initial-frame-alist '((width . 200)(height . 60)(top . 50)(left . 100)))
  (set-face-attribute 'default nil :height 130)))
