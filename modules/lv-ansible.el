;;; Ansible Support

(use-package ansible
  :ensure t
  :after yaml-mode
  :init
  (prog-mode)
  (yaml-ts-mode)
  (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
)

(use-package ansible-doc
  :ensure t
  :config
  (add-hook 'yaml-mode-hook #'ansible-doc-mode)
)

(use-package jinja2-mode
  :ensure t
  :config
  (define-hostmode poly-yaml-hostmode :mode 'yaml-ts-mode)
  (setq jinja2-enable-indent-on-save nil)
  :mode 
  (rx ".j2" string-end)
)

(use-package poly-ansible
  :ensure t
  :config 
)

(provide 'lv-ansible)
