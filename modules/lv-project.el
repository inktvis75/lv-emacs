;;; Project Management

(use-package xref
  :ensure t
)

(use-package project
  :ensure nil
  :custom
  (project-vc-extra-root-markers '(".project" "requirements.txt" "package.json"))
  :config
  (add-to-list 'project-switch-commands
               '(project-dired "Dired at root"))
  (remove-hook 'project-switch-commands '(project-vc-dir "VC-Dir")))

(provide 'lv-project)
