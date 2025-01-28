;;; Evil packages

(use-package evil
  :ensure t
  :demand t
  :diminish undo-tree-mode
  :init
  (setq evil-want-C-u-scroll t
        evil-want-keybinding nil
        evil-shift-width 4)
  :hook (after-init . evil-mode)
  :config
  (evil-mode 1)
  (with-eval-after-load 'evil-maps 
    (define-key evil-insert-state-map (kbd "C-n") nil)
    (define-key evil-insert-state-map (kbd "C-p") nil))
    (evil-ex-define-cmd "q" 'kill-this-buffer)
    (evil-ex-define-cmd "wq" 'save-and-kill-this-buffer) 
    (defun save-and-kill-this-buffer()(interactive)(save-buffer)(kill-current-buffer))
    (setq confirm-kill-emacs #'yes-or-no-p)
)

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (setq evil-collection-mode-list '(dashboard dired ibuffer))
  (evil-collection-init)
)

(use-package evil-commentary
  :ensure t
  :after evil
  :diminish
  :config (evil-commentary-mode +1)
)

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t
)


(provide 'lv-evil)
