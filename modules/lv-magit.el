(use-package magit
  :straight t
  :bind (("C-x g" . magit))
)

(use-package git-gutter
  :straight t
  :config
  (global-git-gutter-mode +1)
)

(provide 'lv-magit)
