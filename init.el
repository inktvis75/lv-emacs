;; init.el --- LinVirt Emacs config -*- lexical-binding: t; -*-

;;; Custom File
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)

;;; Personal Information 

(defvar user-full-name "Frederik Vos")
(defvar user-mail-address "frederik.vos@linvirt.com")

;;; MacOS fix
(defun my-system-type-is-darwin ()
  "Return true if system is darwin-based (Mac OS X)"
  (string-equal system-type "darwin")
)

(when (my-system-type-is-darwin)
  (setenv "LIBRARY_PATH"
          (string-join
           '("/opt/homebrew/lib/"
             "/opt/homebrew/opt/gcc/lib/gcc/current"
             "/opt/homebrew/opt/libgccjit/lib/gcc/current/" 
             "/opt/homebrew/opt/gcc/lib/gcc/current/gcc/aarch64-apple-darwin24/")
           ":"))
  (setenv "PATH"
          (concat (getenv "PATH")
                  ":/opt/homebrew/bin:/opt/homebrew/sbin"))
  (setenv "PKG_CONFIG_PATH" 
          (concat (getenv "PKG_CONFIG_PATH")
                  ":/opt/homebrew/opt/glib/lib/pkgconfig/:/opt/homebrew/lib/pkgconfig")
  )
  
  (setq exec-path (append exec-path
                          '("/opt/homebrew/bin:/opt/homebrew/sbin")
                  
                  )
  )
)

;; Lisp
(setq inferior-lisp-program "/opt/homebrew/bin/sbcl")

;;; Modules Dir
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

;;; Modules
(require 'lv-core)
(require 'lv-elpaca)
(require 'lv-theme)
(require 'lv-modeline)
(require 'lv-shell)
(require 'lv-spell)
(require 'lv-yaml)
(require 'lv-ansible)
(require 'lv-filemgr)
(require 'lv-org)
(require 'lv-pdf)
(require 'lv-treesitter)
(require 'lv-complete)
(require 'lv-python)
(require 'lv-magit)
(require 'lv-project)
(require 'lv-slime)
(require 'lv-lilypond)
(require 'lv-whichkey)
(require 'lv-containers)
;;; (require 'lv-evil)
(require 'lv-dash)

