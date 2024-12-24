; Theme
(straight-use-package 'modus-themes)
(straight-use-package 'zenburn-theme)
(straight-use-package 'sublime-themes)
(straight-use-package 'kuronami-theme)
(load-theme 'zenburn :no-confirm)

(use-package all-the-icons
  :straight t
  :defer t
  :if (display-graphic-p)
)

(use-package nerd-icons-dired
    :straight (:host github :repo "rainstormstudio/nerd-icons-dired" :files ("*.el"))
    :hook
    (dired-mode . nerd-icons-dired-mode)
)

; Distinguish Buffers
(use-package solaire-mode
  :if (display-graphic-p)
  :straight t
  :init (solaire-global-mode +1)
)

; Automatic Resizing Windows
(use-package golden-ratio
  :if (display-graphic-p)
  :straight t
  :init (golden-ratio-mode 1)
)

(provide 'lv-theme)
