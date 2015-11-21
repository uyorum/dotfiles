(el-get-bundle! auctex)

(setq TeX-default-mode 'japanese-latex-mode)
(setq japanese-TeX-command-default "pTeX")
(setq japanese-LaTeX-command-default "pLaTeX")
(setq japanese-LaTeX-default-style "jsarticle")
(setq TeX-engine-alist '((ptex "pTeX" "eptex" "platex" "eptex")
                         (jtex "jTeX" "jtex" "jlatex" nil)
                         (uptex "upTeX" "euptex" "uplatex" "euptex")
                         ))
(setq TeX-engine 'ptex)
(setq TeX-view-program-list '(("xdvi" "xdvi -watchfile 1 %d")
;                              ("zathura" "zathura -s -x \"emacsclient --no-wait +%%{line} %%{input}\"%o")
                              ))
(setq TeX-view-program-selection '((output-dvi "xdvi")
                                   (output-pdf "zathura")
                                   ))
(setq preview-image-type 'dvipng)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-source-correlate-start-server t)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook
          (function (lambda ()
                       (add-to-list 'TeX-command-list
                                    '("pdfpLaTeX" "platex %S %(mode) %t && dvipdfmx %d"
                                      TeX-run-TeX nil (latex-mode) :help "Run pLaTeX and dvipdfmx"))
                       (add-to-list 'TeX-command-list
                                    '("pLaTeX" "platex %S %(mode) %t"
                                      TeX-run-TeX nil (latex-mode) :help "Run ASCII pLaTeX"))
                       )))

;; synctex
(setq TeX-source-correlate-method 'synctex)
(setq TeX-source-correlate-start-server t)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
;; kinsoku.el
(setq kinsoku-limit 10)
 ;; master file
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
