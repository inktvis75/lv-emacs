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
(require 'lv-modeline)
(require 'lv-packages)
(require 'lv-theme)
(require 'lv-shell)
(require 'lv-spell)
(require 'lv-complete)
(require 'lv-treemacs)
(require 'lv-org)
(require 'lv-pdf)
(require 'lv-treesitter)
(require 'lv-lsp)
(require 'lv-python)
(require 'lv-helm)
(require 'lv-magit)
(require 'lv-project)
(require 'lv-lilypond)
(require 'lv-whichkey)
(require 'lv-containers)
(require 'lv-dash)

