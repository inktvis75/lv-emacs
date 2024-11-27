(if (and (fboundp 'treesit-available-p)
         (treesit-available-p))
    (progn ; emacs is built with treesit
      (use-package treesit-auto
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

(provide 'lv-treesitter)
