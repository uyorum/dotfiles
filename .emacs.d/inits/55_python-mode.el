(el-get-bundle! python-mode)

(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))

;; flymake for python
;; `pip install pep8 pyflakes`
(add-hook 'python-mode-hook 'flymake-find-file-hook)
(defun flymake-pyflakes-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace)))
    (list (concat BIN "/pycheck") (list temp-file))))
(add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init))
