(use-package company
  :ensure t
  :custom
  (company-idle-delay 0.0)
  (company-minimum-prefix-length 4)
  (company-selection-wrap-around t)
  :hook
  ((text-mode-hook . company-mode)
   (prog-mode-hook . company-mode))
)

(use-package yasnippet
  :straight t
  :ensure t
  :demand t
  :requires (company)
  :diminish yas-minor-mode
  :after (company)
  :hook
  ((text-mode
          prog-mode
          conf-mode
          snippet-mode) . yas-minor-mode-on)
  :config
  (validate-setq 
    yas-verbosity 1
    yas-wrap-around-region t
  )
  (yas-reload-all)
)

(use-package company-tabnine
  :straight t
)

(use-package yasnippet-snippets 
  :straight t
  :ensure t
  :requires (company-yasnippet company-tabnine)
)

;; There should be a better way, for now it works:
(yas-global-mode 1)
(global-set-key (kbd "C-c y") 'company-yasnippet)

(provide 'lv-complete)
