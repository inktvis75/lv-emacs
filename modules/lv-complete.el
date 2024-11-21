(use-package company
  :ensure t
  :custom
  (company-idle-delay 0.0)
  (company-minimum-prefix-length 4)
  (company-selection-wrap-around t)
  :hook
  ((text-mode-hook . company-mode)
   (prog-mode-hook . company-mode))
  :bind
  (:map company-active-map
    ("<tab>" . nil)
    ("TAB" . nil)
    ("M-<tab>" . company-complete-common-or-cycle)
    ("M-<tab>" . company-complete-selection)))

(provide 'lv-complete)
