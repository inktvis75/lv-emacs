(use-package evil
  :straight t
  :diminish undo-tree-mode
  :init
  (setq evil-want-C-u-scroll t
        evil-want-keybinding nil
        evil-shift-width 4)
  :hook (after-init . evil-mode)
  :config
  (with-eval-after-load 'evil-maps 
    (define-key evil-insert-state-map (kbd "C-n") nil)
    (define-key evil-insert-state-map (kbd "C-p") nil))
    (evil-ex-define-cmd "q" 'kill-this-buffer)
    (evil-ex-define-cmd "wq" 'save-and-kill-this-buffer) 
    (defun save-and-kill-this-buffer()(interactive)(save-buffer)(kill-current-buffer))
    (setq confirm-kill-emacs #'yes-or-no-p)
)

(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-company-use-tng nil)
  (evil-collection-init)
)

(use-package evil-commentary
  :after evil
  :diminish
  :config (evil-commentary-mode +1)
)

(use-package treemacs-evil
  :after (treemacs evil)
  :straight t
)

(provide 'lv-evil)
