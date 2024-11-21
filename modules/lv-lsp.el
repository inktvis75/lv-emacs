(use-package lsp-mode
    :straight t
    :custom
    (gc-cons-threshold 100000000) ;; set per the lsp-doctor recommendation
    (read-process-output-max (* 1024 1024)) ;; same reason ^
    (lsp-keymap-prefix "C-c l")
    :hook (
           (yaml-mode . lsp)
           (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp
)

(use-package lsp-ui
    :straight t
    :hook (lsp-mode . lsp-ui-mode)
    :commands lsp-ui-mode
)

(use-package lsp-ivy
    :straight t
    :after lsp-mode
)

(use-package lsp-treemacs
    :straight t
    :after lsp-mode
    :commands lsp-treemacs-errors-list
)
(use-package yaml-mode
  :defer t
  :straight t
)

(use-package jinja2-mode
  :straight t
  :defer t
)

(use-package ansible
  :after yaml-mode
  :straight t  
  :custom-face
  (ansible-task-label-face ((t (:foreground "#1d9a79"))))
  :config (add-hook 'ansible-mode-hook (lambda () (flyspell-mode -1)))
)

(use-package poly-ansible
  :straight t           
  :defer t
  :diminish
)

(provide 'lv-lsp)
