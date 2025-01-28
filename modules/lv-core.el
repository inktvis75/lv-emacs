;;; lv-core.el --- Module providing core functionalities in my Emacs config

;;; Some Defaults
(setq undo-limit 100000)
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 1024 1024 100))))

;;; Editing Defaults
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
(setq ring-bell-function 'ignore)
(tooltip-mode 1)

;;; Remove trailing whitespace except current line.
(defun my/delete-trailing-whitespace-except-current-line ()
  "Delete trailing whitespace in the whole buffer, except on the current line.
  The current line exception is because we do want to remove any whitespace
  on the current line on saving the file while we are in-between typing something.

  Do not do anything if `do-not-delete-trailing-whitespace' is non-nil."
  (interactive)
  (when (not (bound-and-true-p do-not-delete-trailing-whitespace))
    (delete-trailing-whitespace (point-min) (line-beginning-position))
    (delete-trailing-whitespace (line-end-position) (point-max))))

;;; Backup
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
     kept-new-versions 6
     kept-old-versions 2
     version-control t
)

(provide 'lv-core)
