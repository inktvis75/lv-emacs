(use-package evil
  :init
  (setq evil-want-C-i-jump t
        evil-want-Y-yank-to-eol t
        evil-want-C-u-scroll t
        evil-symbol-word-search t
        evil-want-keybinding nil
        evil-want-abbrev-expand-on-insert-exit t
        evil-visual-update-x-selection-p nil
        evil-mode-line-format nil
        evil-ex-search-vim-style-regexp t
        evil-ex-visual-char-range t
        evil-mode-line-format nil
        evil-normal-state-cursor 'box
        evil-insert-state-cursor 'bar
        evil-emacs-state-cursor 'box
        evil-visual-state-cursor 'hollow
        evil-ex-interactive-search-highlight 'selected-window
        evil-kbd-macro-suppress-motion-error t
        evil-respect-visual-line-mode t
        evil-undo-system 'undo-tree
        ;; evil-want-minibuffer t
        evil-ex-hl-update-delay 0.1)
  (evil-mode 1)
  :config
  ;; Remove C-l from evil-repeat commands
  (evil-declare-abort-repeat 'recenter-top-bottom)
  (defun my/paste-and-indent-after ()
    "emulate [p or ]p in vim adopted from https://emacs.stackexchange.com/questions/31454/evil-mode-how-to-run-evil-indent-on-the-text-ive-just-pasted"
    (interactive)
    (evil-paste-after 1)
    (evil-indent (evil-get-marker ?\[) (evil-get-marker ?\])))

  (defun my/paste-and-indent-before ()
    "emulate [P or ]P in vim"
    (interactive)
    (evil-paste-before 1)
    (evil-indent (evil-get-marker ?\[) (evil-get-marker ?\]))))

(use-package evil-surround :init (global-evil-surround-mode))
(use-package evil-traces :init (evil-traces-mode))                ; show vim preview (e.g. `:m +5')
(use-package evil-exchange :init (evil-exchange-install))         ; exchange stuff (args, paragraphs, ...)
(use-package evil-visualstar :init (global-evil-visualstar-mode)) ; do v to select then * or # to search for it
(use-package evil-args)                                           ; do evil stuff with (function arguments)
(use-package evil-numbers)
(use-package expand-region)                                       ; expand/contract region Intellij-stype
(use-package evil-matchit :init (global-evil-matchit-mode))
(use-package evil-textobj-anyblock)
(use-package evil-textobj-tree-sitter :straight t)
(use-package evil-indent-plus)

(use-package evil-goggles
  :init
  (setq evil-goggles-duration 0.5
        evil-goggles-pulse nil
        evil-goggles-enable-delete nil
        evil-goggles-enable-change nil)
  (evil-goggles-mode))

(use-package evil-org
  :after org
  :hook (org-mode . evil-org-mode)

  :config
  (evil-org-set-key-theme)
  (add-hook 'org-capture-mode-hook #'evil-insert-state))

(use-package evil-escape
  :init
  (setq evil-escape-key-sequence "jk")
  (evil-escape-mode))

(use-package evil-nerd-commenter
  :commands (evilnc-comment-operator
             evilnc-inner-commenter
             evilnc-outer-commenter)
  :config
  (general-define-key
   [remap comment-line] #'evilnc-comment-or-uncomment-lines))

(use-package evil-snipe
  :init
  (setq evil-snipe-smart-case t
        evil-snipe-scope 'buffer
        evil-snipe-use-vim-sneak-bindings t
        evil-snipe-repeat-keys nil
        evil-snipe-char-fold t)
  (evil-snipe-mode)
  (evil-snipe-override-mode))

(use-package evil-anzu
  :demand t
  :init (global-anzu-mode)
  :after evil)

(use-package evil-collection
  :after evil
  :init
  (evil-collection-init)
  (setq evil-collection-key-blacklist '("SPC" "gj" "gk" "gt" "gT" "SPC ]e" "SPC [e")
        evil-collection-mode-list
        '(arc-mode bm bookmark consult comint compile eldoc daemons
                   debug diff-hl diff-mode dired dired-sidebar
                   docker doc-view elisp-refs embark eldoc eshell
                   eww elfeed flymake grep help helpful ibuffer
                   imenu macrostep magit-sections magit magic-todos
                   man markdown-mode mu4e notmuch org org-roam
                   osx-dictionary pdf python replace rg ripgrep
                   tab-bar term vertico vterm wdired wgrep which-key
                   xref xwidget flymake flycheck)
        ;; Enable if you want vim keybinds in minibuffer
        ;; evil-collection-setup-minibuffer t
        evil-collection-want-unimpaired-p nil))

(use-package evil-mc
  :init
  (global-evil-mc-mode 1)

  ;; Clear default keybinds/behavior
  (evil-define-key '(normal visual) 'global
    (kbd "C-<down-mouse-2>") nil)
  (evil-define-key '(normal visual) evil-mc-key-map
    (kbd "C-p") nil
    (kbd "C-n") nil
    (kbd "C-t") nil
    (kbd "M-p") nil
    (kbd "M-n") nil)
  (setq evil-mc-undo-cursors-on-keyboard-quit t))

(use-package edit-indirect)

(use-package drag-stuff)

;; Define my own evil text objects
(evil-define-text-object my/evil-textobj-anyblock-inner-quote
  (count &optional beg end type)
  "Select the closest outer quote."
  (require 'evil-textobj-anyblock)
  (let ((evil-textobj-anyblock-blocks
         '(("'" . "'")
           ("\"" . "\"")
           ("`" . "'")
           ("“" . "”"))))
    (evil-textobj-anyblock--make-textobj beg end type count nil)))

(evil-define-text-object my/evil-textobj-anyblock-outer-quote
  (count &optional beg end type)
  "Select the closest outer quote."
  (require 'evil-textobj-anyblock)
  (let ((evil-textobj-anyblock-blocks
         '(("'" . "'")
           ("\"" . "\"")
           ("`" . "'")
           ("“" . "”"))))
    (evil-textobj-anyblock--make-textobj beg end type count t)))

(evil-define-text-object my/evil-textobj-whole-buffer-txtobj (count &optional _beg _end type)
  "Text object to select the whole buffer."
  (evil-range (point-min) (point-max) type))

;; delete trailing whitespace on save
(add-hook 'before-save-hook
          (lambda ()
            (unless (eq major-mode 'fundamental-mode)
              (delete-trailing-whitespace))))

(evil-select-search-module 'evil-search-module 'evil-search)

(delete-selection-mode 1)

(provide 'lv-evil)
;;; lv-evil.el ends here
