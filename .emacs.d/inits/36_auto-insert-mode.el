(el-get-bundle! mineo/yatemplate)

;; ~/.emacs.d/templates以下にyasnippet形式でファイルを用意するとauto-insert-alistを生成してくれる
(yatemplate-fill-alist)
(auto-insert-mode 1)
