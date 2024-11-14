(define-key key-translation-map (kbd "<s-mouse-1>") (kbd "<mouse-2>"))

(use-package flycheck
  :defer 0.5
  :custom
  (flycheck-check-syntax-automatically '(save mode-enabled))
  (flycheck-emacs-lisp-load-path 'inherit)
  (flycheck-puppet-lint-disabled-checks '("140chars" "80chars"))
  :config
  (defun my/ansible-minor-mode-p ()
    (bound-and-true-p ansible))
  (flycheck-define-checker my/ansible-lint
    "An Ansible DSL style checker using ansible-lint.
     See URL `https://docs.ansible.com/ansible-lint/'."
    :command ("ansible-lint" "--parseable-severity" source)
    :error-patterns
    ((info line-start
           (file-name) ":" line ":"
           " [" (id (one-or-more (any alpha)) (one-or-more digit)) "] [INFO]"
           (message (one-or-more not-newline))
           line-end)
     (warning line-start
              (file-name) ":" line ":"
              " [" (id (one-or-more (any alpha)) (one-or-more digit)) "] "
              (message (one-or-more not-newline))
              line-end))
    :modes yaml-mode
    :predicate my/ansible-minor-mode-p)
  (add-to-list 'flycheck-checkers 'my/ansible-lint)
  (global-flycheck-mode 1))

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(use-package flyspell-correct
  :after flyspell
  :straight t
  :bind (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper))
)

(use-package flyspell-correct-ivy
  :straight t
  :after flyspell-correct
)

(provide 'lv-spell)
