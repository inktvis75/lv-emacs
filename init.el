;;; init.el --- LinVirt Emacs config -*- lexical-binding: t; -*-

(defvar user-full-name "Frederik Vos")
(defvar user-mail-address "frederik.vos@linvirt.com")

;; Modules Dir
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

;; Custom File
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)

;; Modules
(require 'lv-core)
(require 'lv-packages)
(require 'lv-theme)
(require 'lv-evil)
(require 'lv-shell)
(require 'lv-spell)
(require 'lv-complete)
(require 'lv-treemacs)
(require 'lv-org)
(require 'lv-pdf)
(require 'lv-treesitter)
(require 'lv-lsp)
(require 'lv-snippets)
(require 'lv-magit)
(require 'lv-project)
(require 'lv-lilypond)
(require 'lv-dash)
