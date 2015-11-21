;; Need to install cmigemo
;; http://qiita.com/kenbeese/items/ebbf0128d7c752a94a22
;; http://kurokawh.blogspot.jp/2014/08/emacscygwinmac-cygwinmaccmigemo.html
(el-get-bundle! migemo)

(setq migemo-command "cmigemo")
(cond ((eq system-type 'windows-nt)
       (setq migemo-dictionary "C:/ProgramData/cmigemo-default-win/dict/utf-8/migemo-dict")
       (setq migemo-command "C:/ProgramData/cmigemo-default-win/cmigemo.exe"))
      ((eq system-type 'gnu/linux)
       (setq migemo-dictionary "/usr/share/migemo/utf-8/migemo-dict"))
      ((eq system-type 'darwin)
       (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
       (setq migemo-command "/usr/local/bin/cmigemo")))
(setq migemo-options '("-q" "--emacs" "-i" "\g"))
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)
