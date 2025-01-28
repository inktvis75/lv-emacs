;;; Emacs and Docker/Kubernetes

(use-package docker
  :ensure t
  :bind ("C-c d" . docker)
)

(use-package kubed
  :ensure t
)

(provide 'lv-containers)
