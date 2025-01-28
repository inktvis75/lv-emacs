;;; Spell check 

(use-package jinx
  :ensure t
  :hook (emacs-startup . global-jinx-mode)
  :init
  :bind (("C-;" . jinx-correct)
         ("C-M-;" . jinx-languages))
)

(provide 'lv-spell)
