(use-package moody
  :ensure t
  :config
  (setq x-underline-at-descent-line t)
  (setq-default mode-line-format '(" "
     mode-line-front-space
     mode-line-client
     mode-line-frame-identification
     mode-line-buffer-identification " " mode-line-position
     (vc-mode vc-mode)
     (multiple-cursors-mode mc/mode-line)
     " " mode-line-modes
     mode-line-end-spaces)
    )
)

(use-package minions
  :ensure t
  :demand t
  :config
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (minions-mode 1)
  :custom
  (minions-mode-line-lighter "…")
  (minions-mode-line-delimiters '("" . ""))
)

(provide 'lv-modeline)
