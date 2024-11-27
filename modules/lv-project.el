(use-package dired-subtree
  :ensure t
  :bind (:map dired-mode-map ("i" . 'dired-subtree-toggle))
  :bind (:map dired-mode-map ("I" . 'dired-subtree-remove)))

(use-package dirtree
  :ensure t)

(use-package project
  :straight (:type built-in)
  :custom
  (project-list-file (concat user-cache-directory "projects"))
  (project-vc-extra-root-markers '(".project" "requirements.txt" "package.json"))
  :config
  (add-to-list 'project-switch-commands
               '(project-dired "Dired at root"))
  (remove-hook 'project-switch-commands '(project-vc-dir "VC-Dir")))

(provide 'lv-project)
