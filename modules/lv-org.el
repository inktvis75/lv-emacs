(use-package org
  :straight (:type built-in)
  :hook
  (org-mode . auto-fill-mode)
  (org-mode . (lambda() (display-line-numbers-mode 0)))
  :config
  (setq org-startup-indented t
   org-src-font-natively t
   org-highlight-latex-and-related '(native latex script entities)
   org-fontify-done-headline t
   org-fontify-quote-and-verse-blocks t
   org-fontify-whole-heading-line t
   org-hide-leading-stars t
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-edit-src-content-indentation 0
   org-src-tab-acts-natively t
   org-src-preserve-indentation t
  )
)

(use-package org-download
  :init
  (add-hook 'dired-mode-hook 'org-download-enable)
  :custom
  (org-download-method 'directory)
  (org-download-image-dir "images")
  (org-download-heading-lvl nil)
  (org-download-timestamp "%Y%m%d%H%M%S_")
)

(use-package pdf-tools
  :mode
  ("\\.[pP][dD][fF]\\'" . pdf-view-mode)
  :config
  (add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))
)

(use-package ox-pandoc
  :defer t
  :when (executable-find "pandoc")
  :after ox
  :init
    (add-to-list 'org-export-backends 'pandoc)
    (setq org-pandoc-options
          '((standalone . t)
            (mathjax . t)
            (variable . "revealjs-url=https://revealjs.com"))
    )
)

(use-package citeproc
  :after (org)
  :defer t
  :straight (:build t))

(use-package org-contrib
  :after (org)
  :defer t
  :straight (:build t)
  :init
  (require 'ox-extra)
  (ox-extras-activate '(latex-header-blocks ignore-headlines)))

(use-package ox-epub
  :after (org ox)
  :straight (:build t))

;;; Latex Classes
(with-eval-after-load 'ox-latex
    (add-to-list 'org-latex-classes
        '("koma-book"
          "\\documentclass{scrbook}"
         ("\\chapter{%s}" . "\\chapter{%s}")
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")))
    (add-to-list 'org-latex-classes
        '("scrbook"
          "\\documentclass{scrbook}"
         ("\\chapter{%s}" . "\\chapter{%s}")
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")))
    (add-to-list 'org-latex-classes
        '("memoir"
          "\\documentclass{memoir}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
         )
    )
)

(with-eval-after-load 'ox-beamer
    (add-to-list 'org-latex-classes
        '("beamer"
          "\\documentclass\[presentation\]{beamer}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         )
        )
    (add-to-list 'org-beamer-environments-extra
        '("onlyenv" "O" "\\begin{onlyenv}%a" "\\end{onlyenv}")
    )
)

;;; Latex Compiler
(customize-set-value 'org-latex-with-hyperref nil)
(setq org-latex-listings 'listings)
(setq org-latex-pdf-process (list "latexmk -f -lualatex %f"))
(setq org-latex-pdf-process '("latexmk -shell-escape -f -lualatex %f"))

;;; Macros
(setq org-export-global-macros
    '(
      ("kbd" . "@@html:<kbd>$1</kbd>@@ @@markdown:<kbd>$1</kbd>@@ @@latex:\\keystroke{$1}@@")
      ("kbdt" . "@@html:<kbd>TAB</kbd>@@ @@markdown:<kbd>TAB</kbd>@@ @@latex:\\Tab@@")
      ("kbda" . "@@html:<kbd>Alt</kbd>@@ @@markdown:<kbd>Alt</kbd>@@ @@latex:\\Alt@@")
      ("kbde" . "@@html:<kbd>Enter</kbd>@@ @@markdown:<kbd>Enter</kbd>@@ @@latex:\\Enter@@")
      ("kbdc" . "@@html:<kbd>Esc</kbd>@@ @@markdown:<kbd>Esc</kbd>@@ @@latex:\\Esc@@")
      ("kbdr" . "@@html:<kbd>Ctrl</kbd>@@ @@markdown:<kbd>Ctrl</kbd>@@ @@latex:\\Ctrl@@")
      ("kbdad" . "@@html:<kbd>&#8595;</kbd>@@ @@markdown:<kbd>&#8595;</kbd> @@latex:\\DArrow@@")
      ("kbdau" . "@@html:<kbd>&#8593;</kbd>@@ @@markdown:<kbd>&#8593;</kbd>@@ @@latex:\\UArrow@@")
      ("kbdal" . "@@html:<kbd>&#8592;</kbd>@@ @@markdown:<kbd>&#8592;</kbd>@@ @@latex:\\LArrow@@")
      ("kbdar" . "@@html:<kbd>&&#8594;</kbd>@@ @@markdown:<kbd>&&#8594;</kbd>@@ @@latex:\\RArrow@@")
     )
)
;;; Fix underscores
(setq org-export-with-sub-superscripts nil)

;;; Syntax Highlighting
(use-package htmlize)
(setq org-html-postamble nil)
(setq org-src-window-setup 'current-window)

;;; Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (shell . t)
   (emacs-lisp . t)
   )
)

(provide 'lv-org)
