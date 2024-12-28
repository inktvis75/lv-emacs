;;; lv-core.el --- Module providing core functionalities in my Emacs config

;; Some Defaults
(setq undo-limit 100000)
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 8 1024 1024))))

;; Editing Defaults
(setq tab-always-indent nil)
(setq-default default-tab-width 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(set-face-bold-p 'bold nil)
(setq tex-fontify-script nil)
(electric-pair-mode 1)
(show-paren-mode 1)
(global-hl-line-mode 1)
(setq select-enable-clipboard t)
(setq-default major-mode 'text-mode)
(global-auto-revert-mode t)
(add-hook 'text-mode-hook 'visual-line-mode)

;; Backup
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
     kept-new-versions 6
     kept-old-versions 2
     version-control t
)
(provide 'lv-core)
