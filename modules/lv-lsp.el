(use-package yasnippet
  :ensure t
  :demand t
  :diminish yas-minor-mode
  :hook
  ((text-mode
          prog-mode
          conf-mode
          snippet-mode) . yas-minor-mode-on)
  :config
  (setq 
    yas-verbosity 1
    yas-wrap-around-region t
  )
  (yas-global-mode 1)
  (global-set-key (kbd "C-c y") 'company-yasnippet)
  (yas-reload-all)
)

(use-package lsp-bridge
  :after (yasnippet orderless)
  :defer 5
  :ensure (
    :host github
    :type git
    :repo "manateelazycat/lsp-bridge"
    :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
    :build (:not compile)
  )
  :config
  (setq acm-enable-quick-access t)
  (define-key acm-mode-map (kbd "C-u") 'acm-select-prev)
  (define-key acm-mode-map (kbd "C-t") 'acm-select-next)
  (setq lsp-bridge-enable-signature-help t)
  (setq lsp-bridge-signature-help-fetch-idle 0.3)
  (setq lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame)
  (setq lsp-bridge-signature-show-with-frame-position 'point)
  (setq lsp-bridge-python-lsp-server "pyright")
  :init
  (global-lsp-bridge-mode)
)

(use-package yasnippet-snippets
  :ensure t
)

(provide 'lv-lsp)
