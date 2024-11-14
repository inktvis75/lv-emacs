(use-package vertico
  :straight (:files (:defaults "extensions/*"))
  :bind (:map vertico-map
              ("C-j" . vertico-next)
              ("C-k" . vertico-previous)
              ("M-j" . vertico-next)
              ("M-k" . vertico-previous)
              ("C-f" . vertico-exit)
              :map minibuffer-local-map
              ("M-h" . backward-kill-word))
  :custom
  (vertico-cycle t)
  (vertico-resize t)
  :init
  (vertico-mode)
  :config
  (vertico-mouse-mode))

;; configure directory extension.
(use-package vertico-directory
  :straight nil
  :load-path "straight/repos/vertico/extensions"
  :after vertico
  :ensure nil
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word)))

; Orderless
(use-package orderless
  :straight t
  :init
  (setq completion-styles '(orderless partial-completion basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles basic partial-completion)))))

; Marginaia
(use-package marginalia
  :straight t
  :after vertico
  :init
  (marginalia-mode))

; Consult
(use-package consult
  :straight t
  :bind
  (
   ("C-c h" . consult-history)
   ("C-c j" . consult-line)
   ("C-c D" . consult-flymake)
   ("C-c b" . consult-bookmark)
   ("C-c k" . consult-kmacro)
   ("C-x b" . consult-buffer)
   ("C-x M-:" . consult-complex-command)
   ("C-x 4 b" . consult-buffer-other-window)
   ("C-x 5 b" . consult-buffer-other-frame)
   ("C-x r b" . consult-bookmark)
   ("M-g e" . consult-compile-error)
   ("M-g g" . consult-goto-line)
   ("M-g M-g" . consult-goto-line)
   ("M-g o" . consult-outline)
   ("M-g m" . consult-mark)
   ("M-g k" . consult-global-mark)
   ("M-g i" . consult-imenu)
   ("M-g I" . consult-imenu-multi)
   ("C-c f" . consult-ripgrep)
   ("C-c r" . consult-recent-file)
   ("C-s" . consult-line)
   ("M-y" . consult-yank-from-kill-ring)
   ("<help> a" . consult-apropos))

  :init
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  (setq consult-ripgrep-command "rg --null --line-buffered --color=ansi --max-columns=1000 --ignore-case --no-heading --line-number . -e ARG OPTS"))

; Embark
(use-package embark
  :straight t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none))))
  :hook
  (embark-collect-mode . consult-preview-at-point-mode)
  (embark-collect-mode . embark-consult-preview-minor-mode))

(use-package embark-consult
  :straight t
  :after (embark consult)
  :demand t 
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(provide 'lv-complete)
