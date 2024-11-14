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

(use-package lsp-pyright
    :straight t
    :after lsp
    :hook (python-mode . (lambda () (require 'lsp-pyright) (lsp-deferred)))
    :init (setq lsp-pyright-python-executable-cmd "python3")
)

(use-package go-mode
  :straight t
  :mode "\\.go\\'"
  :config
  (defun db/go-mode-hook()
    (setq tab-width 2)
    (add-hook 'before-save-hook 'gofmt-before-save)
    (set (make-local-variable 'compile-command)
         "go test"))
    :config (defun lsp-go-install-save-hooks ()
            (add-hook 'before-save-hook #'lsp-format-buffer t t)
            (add-hook 'before-save-hook #'lsp-organize-imports t t))
            (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
    :hook ((go-mode . lsp-deferred))
    :hook ((go-mode . db/go-mode-hook))
    :hook ((go-mode . yas-minor-mode))
    :hook ((go-mode . subword-mode))
)

(use-package rust-mode
  :straight t
  :mode "\\.rs\\'"
  :init (setq rust-format-on-save t))

(use-package cargo
  :straight t
  :defer t)

(use-package rustic
  :disabled t
  :config
  (setq rustic-format-on-save nil)
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
