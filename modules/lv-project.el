(use-package dired-subtree
  :ensure t
  :bind (:map dired-mode-map ("i" . 'dired-subtree-toggle))
  :bind (:map dired-mode-map ("I" . 'dired-subtree-remove)))

(use-package dirtree
  :ensure t)

(provide 'lv-project)
