;;; Python Support

(use-package python
  :ensure nil
  :custom
  (python-shell-buffer-name "Python")
  (python-shell-interpreter "python3")
  :hook
  (python-mode-hook . flyspell-prog-mode)
  (python-mode-hook . flycheck-mode)
)

(use-package py-vterm-interaction
  :ensure t
  :hook (python-mode . py-vterm-interaction-mode)
  :config
  (setq-default py-vterm-interaction-repl-program "python3")
  (setq-default py-vterm-interaction-silent-cells t)
  )

(use-package pyenv-mode
  :ensure t
  :if (eq system-type 'darwin)
  :after python
  :hook
  (python-mode-hook . pyenv-mode))

(use-package pyvenv
  :ensure t
  :after python
  :custom
  (pyvenv-workon "env")
  :hook
  ((python-mode-hook . pyvenv-mode)
   (pyvenv-post-activate-hooks . pyvenv-restart-python)
   (pyvenv-post-deactivate-hooks . pyvenv-restart-python))
  :config
  (defalias 'workon 'pyvenv-workon)
  (defalias 'deactivate 'pyvenv-deactivate))

(use-package envrc
  :ensure t
  :init 
  (envrc-global-mode)
)

(use-package ein
  :ensure t
)

;;; Indent Guessing and Completion
(add-to-list 'python-shell-completion-native-disabled-interpreters "python3")
(setq python-indent-guess-indent-offset t)
(setq python-indent-guess-indent-offset-verbose nil)

(provide 'lv-python)
