;;; Theme

(use-package emacs
  :init (add-to-list 'default-frame-alist '(font . "JetBrains Mono-13"))
)

(use-package modus-themes
   :ensure t
)

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (load-theme 'sanityinc-tomorrow-bright)
)

;;; Icons

(use-package nerd-icons
  :ensure t
)

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook)
)

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
)

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode)
)

(use-package treemacs-nerd-icons
  :ensure t
  :after treemacs
  :functions treemacs-load-theme
  :custom-face
  (treemacs-nerd-icons-root-face ((t (:inherit nerd-icons- :height 1.3))))
  (treemacs-nerd-icons-file-face ((t (:inherit treemacs-file-face :height 1.0))))
  :config
  (treemacs-load-theme "nerd-icons")
)

;;; Distinguish Buffers
(use-package solaire-mode
  :ensure  t
  :demand t
  :config
  (solaire-global-mode +1)
)

;;; Automatic Resizing Windows
(use-package golden-ratio
  :ensure t
  :demand t
  :config
  (golden-ratio-mode 1)
)

(provide 'lv-theme)
