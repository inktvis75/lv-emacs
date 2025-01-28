;;; Ansible Support

(use-package ansible
  :ensure t
  :after yaml-mode
  :init
  (prog-mode)
  (yaml-ts-mode)
  (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
  :custom
  (ansible-vault-password-file "~/.ansible-vault-pwd")

  :bind
  (:map ansible-key-map
        ("C-c v" . rr/set-ansible-vault-mimipass-pwd)
        ("C-c C-d" . ansible-doc))

  :config
  (add-hook 'ansible-hook 'ansible-auto-decrypt-encrypt)
  (defun rr/write-string (string file)
    (with-temp-buffer
      (insert string)
      (write-region (point-min) (point-max) file)))

  (defun rr/set-ansible-vault-mimipass-pwd ()
    "Choose which mimipass password to be used for ansible vault."
    (interactive)
    (rr/write-string (format "#!/bin/bash\nmimipass get %s"
                             (rr/helm-mimipass))
                     ansible-vault-password-file)
    (chmod ansible-vault-password-file
           (string-to-number "700" 8)))
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
