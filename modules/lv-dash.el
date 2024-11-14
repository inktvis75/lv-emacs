(use-package dashboard
  :straight (:build t)
  :ensure t
  :init
  (use-package emacs
      :custom
      (recentf-max-menu-items 25)
      (recentf-max-saved-items 25)
      :config
      (recentf-mode 1)
  (dashboard-setup-startup-hook)
  )
  :custom
  (initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (dashboard-banner-logo-title "LinVirt's Vanilla Emacs")
  (dashboard-startup-banner    'official)
  (dashboard-center-content    t)
  (dashboard-show-shortcuts    t)
  (dashboard-set-navigator     t)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons    t)
  (dashboard-set-init-info     t)
  (dashboard-items '((recents . 5)(projects . 5)))
)

(provide 'lv-dash)
