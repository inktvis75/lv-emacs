(use-package transient
  :ensure t
)  

(use-package magit
  :ensure t
  :bind (("C-x g" . magit))
  :after transient
)

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1)
)

(provide 'lv-magit)
