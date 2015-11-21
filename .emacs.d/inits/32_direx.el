(el-get-bundle! direx)

(global-unset-key (kbd "C-x d"))
(global-set-key (kbd "C-x d") 'direx:jump-to-directory-other-window)
