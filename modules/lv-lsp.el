(use-package lsp-mode
    :straight t
    :after company
    :custom
    (gc-cons-threshold 100000000) ;; set per the lsp-doctor recommendation
    (read-process-output-max (* 1024 1024)) ;; same reason ^
    (lsp-keymap-prefix "C-c l")
    :hook (
           (yaml-mode . lsp)
           (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp
    :init 
    (setq lsp-auto-guess-root t       
     lsp-log-io nil
     lsp-enable-indentation t
     lsp-enable-imenu t
     lsp-file-watch-threshold 500
     lsp-prefer-flymake nil)
)

(use-package lsp-ui
    :ensure t 
    :after (lsp-mode)
    :straight t
    :hook (lsp-mode . lsp-ui-mode)
    :commands lsp-ui-mode
)

(use-package helm-lsp
    :straight t
    :after lsp-mode
    :commands (helm-lsp-workspace-symbol)
    :init (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
)

(use-package lsp-treemacs
    :straight t
    :after lsp-mode
    :commands lsp-treemacs-errors-list
)

(provide 'lv-lsp)
