;;; Emacs and Docker/Kubernetes

(use-package docker
  :ensure t
  :bind ("C-c d" . docker)
)

(use-package kubed
  :ensure t
  :config
  (setq kubed-kubectl-program "/opt/homebrew/bin/kubectl")
)

(provide 'lv-containers)
