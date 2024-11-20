(use-package docker
  :straight t
  :ensure t
  :bind ("C-c d" . docker)
)

(use-package kubed
  :straight t
  :ensure t
)

(provide 'lv-containers)
