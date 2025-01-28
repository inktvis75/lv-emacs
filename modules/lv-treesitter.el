(if (and (fboundp 'treesit-available-p)
         (treesit-available-p))
    (progn ; emacs is built with treesit
      (use-package treesit-auto
        :ensure t
        :demand t
        :custom
        (treesit-auto-install nil)
        :config
        (delete 'c treesit-auto-langs)  ; c-ts-mode crashes from time to time
        (global-treesit-auto-mode))
      (setq treesit-font-lock-level 4))
  (use-package tree-sitter
    :init
    (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
    (global-tree-sitter-mode))
  (use-package tree-sitter-langs)
)

(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml"))
)

(provide 'lv-treesitter)
