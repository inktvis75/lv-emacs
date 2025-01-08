(use-package yaml-mode
  :defer t
  :straight t
  :custom
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
)

(use-package outline-yaml
  :ensure t
  :straight (outline-yaml
             :type git
             :host github
             :repo "jamescherti/outline-yaml.el")
  :hook
  ((yaml-mode . outline-yaml-minor-mode)
   (yaml-ts-mode . outline-yaml-minor-mode))
)

(provide 'lv-yaml)
