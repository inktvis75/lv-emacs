(use-package dired
  :ensure nil
  :commands (dired)
  :hook
  ((dired-mode . dired-hide-details-mode)
   (dired-mode . hl-line-mode))
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-dwim-target t)
)

(use-package dired-subtree
  :ensure t
  :after dired
  :bind
  ( :map dired-mode-map
    ("<tab>" . dired-subtree-toggle)
    ("TAB" . dired-subtree-toggle)
    ("<backtab>" . dired-subtree-remove)
    ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil)
)

(use-package trashed
  :ensure t
  :commands (trashed)
  :config
  (setq trashed-action-confirmer 'y-or-n-p)
  (setq trashed-use-header-line t)
  (setq trashed-sort-key '("Date deleted" . t))
  (setq trashed-date-format "%Y-%m-%d %H:%M:%S")
)

(use-package treemacs
  :ensure t
  :config
  (setq treemacs-width 25
        treemacs-follow-mode -1
        treemacs-tag-follow-mode -1
        treemacs-is-never-other-window t
        treemacs-follow-after-init t
        treemacs-icon-open-png   (propertize "⊖ " 'face 'treemacs-directory-face)
        treemacs-icon-closed-png (propertize "⊕ " 'face 'treemacs-directory-face))
  (define-key treemacs-mode-map [mouse-1]
    #'treemacs-single-click-expand-action)
)

(use-package treemacs-projectile
  :ensure t             
)

(use-package treemacs-magit
  :ensure t
)

(provide 'lv-filemgr)
