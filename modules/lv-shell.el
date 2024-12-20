;; Shell
(setq-default explicit-shell-file-name "/bin/bash")

;; Path Variable
(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

;; VTERM
(use-package vterm
  :config
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
      (vterm "*vterm*"))))

(use-package multi-vterm
  :init
  (setq vterm-always-compile-module t)
  :requires vterm
)

;; ESHELL
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

(straight-use-package
 '(eat :type git
       :host codeberg
       :repo "akib/emacs-eat"
       :files ("*.el" ("term" "term/*.el") "*.texi"
               "*.ti" ("terminfo/e" "terminfo/e/*")
               ("terminfo/65" "terminfo/65/*")
               ("integration" "integration/*")
               (:exclude ".dir-locals.el" "*-tests.el"))))

;; Shortcuts
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
