(setq HOME (replace-regexp-in-string "\\\\" "/" (getenv "HOME")))
(setq BIN (locate-user-emacs-file "bin"))

(let ((default-directory (locate-user-emacs-file "elisp")))
  (normal-top-level-add-subdirs-to-load-path))
