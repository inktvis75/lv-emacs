;; Bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
      (unless (file-exists-p bootstrap-file)
      (with-current-buffer
         (url-retrieve-synchronously
          "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
           'silent 'inhibit-cookies)
         (goto-char (point-max))
         (eval-print-last-sexp)))
      (load bootstrap-file nil 'nomessage)
      )
(straight-use-package 'use-package)

;; Straight 
(use-package straight
  :custom
  (straight-use-package 'use-package)
  (straight-use-package-by-default t)
  :config
  ;; packages that I don't want to be installed
  (add-to-list 'straight-built-in-pseudo-packages 'projectile))

(use-package use-package
  :straight (:type built-in)
  :custom
  (use-package-always-defer t)
  (use-package-always-ensure t))

(provide 'lv-packages)

