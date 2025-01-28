(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode)
)

(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode)
)

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless flex))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides '((eglot (styles . (orderless flex)))))
)

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-cycle t)                
  (corfu-quit-at-boundary t)   
  (corfu-quit-no-match t)      
  (corfu-preview-current nil)    
  (corfu-preselect 'prompt)      
  (corfu-on-exact-match nil)     
  :init
  (global-corfu-mode)
)

(use-package emacs
  :custom 
  (completion-cycle-threshold 3)
  (tab-always-indent 'complete)
  (read-extended-command-predicate #'command-completion-default-include-p)
)

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all)
)

(use-package yasnippet-snippets
  :ensure t
)

(use-package lsp-bridge
  :ensure '(
    :type git 
    :host github 
    :repo "manateelazycat/lsp-bridge"
    :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
    :build (:not compile))
  :init
  (global-lsp-bridge-mode)
)

;;; Highlight Indent
(use-package highlight-indent-guides
 :ensure t
 :hook 
 (prog-mode . highlight-indent-guides-mode)
 (yaml-mode . highlight-indent-guides-mode)
 (ansible-mode . highlight-indent-guides-mode)
)




(provide 'lv-complete)
