(use-package yasnippet
  :straight t
  :diminish yas-minor-mode
  :config
  (use-package yasnippet-snippets :straight t)
  :hook (after-init . yas-global-mode)
)

(use-package consult-yasnippet  
  :straight t
)

(provide 'lv-snippets)
