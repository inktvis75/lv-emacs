;;; Emacs and Docker/Kubernetes

(use-package docker
  :ensure t
  :bind ("C-c d" . docker)
)

(use-package kubed
  :ensure t
  :init 
  :bind 
  ("C-c k" . 'kubed-prefix-map)
  ("C-c C-k" . 'kubed-transient)
  :config
  (setq kubed-kubectl-program "/opt/homebrew/bin/kubectl")
)

(use-package k8s-mode
  :ensure t
  :hook (k8s-mode . yas-minor-mode)
)

(provide 'lv-containers)
