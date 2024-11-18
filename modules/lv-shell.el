;; Shell
(use-package exec-path-from-shell
  :straight t
  :config
  (setq-default shell-file-name "/bin/bash")
  (setq-default explicit-shell-file-name "/bin/bash")
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)
  )
  (when (daemonp)
  (exec-path-from-shell-initialize)
  )
)

(use-package vterm
  :init
  (defun my/vterm-here ()
    "Open a terminal buffer in the current window at cwd"
    (interactive)
    (vterm (concat "*vterm-" (string (random 255)) "*")))

  (defun my/vterm-project ()
    "Open a terminal buffer in the current window at project root"
    (interactive)
    (let ((default-directory (project-root (project-current t))))
      (vterm "*vterm*"))))

(use-package eshell
  :straight (:type built-in)
  :init
  (defun my/eshell-here ()
    "Open an eshell buffer in the current window at cwd"
    (interactive)
    (let ((current-prefix-arg (random 255))) (call-interactively #'eshell)))

  (defun my/eshell-project ()
    "Open an eshell buffer in the current window at project root"
    (interactive)
    (let ((default-directory (project-root (project-current t))))
      (eshell))))

(use-package capf-autosuggest
  :hook
  ('comint-mode-hook #'capf-autosuggest-mode)
  ('eshell-mode-hook #'capf-autosuggest-mode))

(use-package fish-mode)

;; hide line numbers and don't truncate lines
(dolist (mode '(term-mode-hook
                vterm-mode-hook
                shell-mode-hook
                eshell-mode-hook
                comint-mode-hook
                dape-repl-mode-hook
                inferior-python-mode-hook
                image-mode-hook))
  (add-hook mode (lambda ()
                   (display-line-numbers-mode 0)
                   (visual-line-mode +1))))

(add-to-list 'term-file-aliases '("foot" . "xterm"))

(provide 'lv-shell)
