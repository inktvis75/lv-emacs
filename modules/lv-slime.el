;;; SLIME: Superior Lisp Interaction Mode for Emacs

(use-package slime
  :ensure t
  :init
  (slime-setup '(slime-fancy slime-quicklisp slime-asdf slime-mrepl))
)


(provide 'lv-slime)
