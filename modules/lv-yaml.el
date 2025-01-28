;;; YAML support

(use-package yaml-mode
  :ensure t
  :mode ((rx ".yamllint")
         (rx ".y" (optional "a") "ml" string-end)
         )
  :init 
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
)

(use-package yaml-pro
  :ensure t
  :hook (yaml-mode-hook . yaml-pro-ts-mode)
  
)


(provide 'lv-yaml)
