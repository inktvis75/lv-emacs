;;; Shell
(setq-default explicit-shell-file-name "/bin/bash")

;;; VTERM
(use-package vterm
  :ensure (vterm :post-build
                 (progn
                   (setq vterm-always-compile-module t)
                   (require 'vterm)
                   ;;print compilation info for elpaca
                   (with-current-buffer (get-buffer-create vterm-install-buffer-name)
                     (goto-char (point-min))
                     (while (not (eobp))
                       (message "%S"
                                (buffer-substring (line-beginning-position)
                                                  (line-end-position)))
                       (forward-line)))
                   (when-let ((so (expand-file-name "./vterm-module.so"))
                              ((file-exists-p so)))
                     (make-symbolic-link
                      so (expand-file-name (file-name-nondirectory so)
                                           "../../builds/vterm")
                      'ok-if-already-exists)
                   )
                 )
          )
  :commands (vterm vterm-other-window)
  :config
  (evil-set-initial-state 'vterm-mode 'emacs)
  (blink-cursor-mode 0)
  :init
   (defun my/vterm-here ()
    "Open a terminal buffer in the current window at cwd"
    (interactive)
    (vterm (concat "*vterm-" (string (random 255)) "*")))

  (defun my/vterm-project ()
    "Open a terminal buffer in the current window at project root"
    (interactive)
    (let ((default-directory (project-root (project-current t))))
      (vterm "*vterm*"))
  )
)

(use-package multi-vterm
  :init
  (setq vterm-always-compile-module t)
  :requires vterm
)

;;; ESHELL
(use-package eshell
  :ensure nil
  :init
  (defun my/eshell-here ()
    "Open an eshell buffer in the current window at cwd"
    (interactive)
    (let ((current-prefix-arg (random 255))) (call-interactively #'eshell)))

  (defun my/eshell-project ()
    "Open an eshell buffer in the current window at project root"
    (interactive)
    (let ((default-directory (project-root (project-current t))))
      (eshell)))
)

;;; Shortcuts
(global-set-key (kbd "C-c t c") 'vterm)
(global-set-key (kbd "C-c t v") 'multi-vterm)
(global-set-key (kbd "C-c t n") 'multi-vterm-next)
(global-set-key (kbd "C-c t p") 'multi-vterm-prev)
(global-set-key (kbd "C-c t r") 'multi-vterm-rename-buffer)
(global-set-key (kbd "C-c t d") 'multi-vterm-dedicated-open)
(global-set-key (kbd "C-c t j") 'multi-vterm-project)
(global-set-key (kbd "C-c t q") 'multi-vterm-dedicated-close)
(global-set-key (kbd "C-c t t") 'multi-vterm-dedicated-toggle)
(global-set-key (kbd "C-c t s") 'multi-vterm-dedicated-select)

(provide 'lv-shell)
