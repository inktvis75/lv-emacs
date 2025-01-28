;;; Ansible Support

(use-package ansible
  :ensure t
  :commands ansible-auto-decrypt-encrypt
  :init
  (put 'ansible-vault-password-file 'safe-local-variable #'stringp)
  :config
  (setq ansible-section-face 'font-lock-variable-name-face
        ansible-task-label-face 'font-lock-doc-face)
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
