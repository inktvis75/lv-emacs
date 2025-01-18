(use-package dashboard
  :straight t
  :demand t
  :init
  (add-hook 'dashboard-mode-hook (lambda () (setq show-trailing-whitespace nil)))
  :custom
  (dashboard-banner-logo-title "[LV-EMACS]")
  (dashboard-center-content t)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-navigator t)
  :config
  (dashboard-setup-startup-hook))

(provide 'lv-dash)
