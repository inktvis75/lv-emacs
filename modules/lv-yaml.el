;;; YAML support

(use-package yaml-mode
  :ensure t
  :mode ((rx ".yamllint")
         (rx ".y" (optional "a") "ml" string-end)
         )
)


(use-package yaml-pro
  :defer t
  :ensure t
)

(use-package outline-yaml
  :ensure t (outline-yaml
    :type git
    :host github
    :repo "jamescherti/outline-yaml.el"
    )
  :hook
  ((yaml-mode . outline-yaml-minor-mode)
   (yaml-ts-mode . outline-yaml-minor-mode))
)

(provide 'lv-yaml)
