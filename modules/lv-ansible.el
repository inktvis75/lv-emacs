(use-package ansible
  :commands ansible-auto-decrypt-encrypt
  :init
  (put 'ansible-vault-password-file 'safe-local-variable #'stringp)
  :config
  (setq ansible-section-face 'font-lock-variable-name-face
        ansible-task-label-face 'font-lock-doc-face)
)

(use-package jinja2-mode
  :mode "\\.j2\\'"
  :config
  (setq jinja2-enable-indent-on-save nil)
)

(use-package poly-ansible
  :straight t
  :defer t
  :diminish
)

(use-package company-ansible
  :straight t
  :ensure t
  :custom
  (add-to-list 'company-backends 'company-ansible)
)

(provide 'lv-ansible)
