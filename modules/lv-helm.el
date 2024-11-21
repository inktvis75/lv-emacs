(use-package helm
  :init
  (setq helm-split-window-inside-p            t
        helm-move-to-line-cycle-in-source     t
        helm-ff-search-library-in-sexp        t
        helm-scroll-amount                    8
        helm-ff-file-name-history-use-recentf t)
  ;; Remove helm-source-info-cl which I don't seem to have
  (setq helm-info-default-sources
        '(helm-source-info-elisp
          helm-source-info-eieio
          helm-source-info-pages))
  :bind (("<f1>" .      helm-resume)
         ("<f2>" .      helm-execute-kmacro)
         ("C-," .       helm-calcul-expression)
         ("C-:" .       helm-eval-expression-with-eldoc)
         ("C-c <SPC>" . helm-all-mark-rings)
         ("C-c f" .     helm-recentf)
         ("C-c g" .     helm-gid)
         ("C-c i" .     helm-imenu)
         ("C-c I" .     helm-imenu-in-all-buffers)
         ("C-h C-s" .   helm-occur)
         ("C-h a" .     helm-apropos)
         ("C-h f" .     helm-find)
         ("C-h g" .     helm-google-suggest)
         ("C-h i" .     helm-info-at-point)
         ("C-h r" .     helm-info-emacs)
         ("C-h s" .     helm-swoop)
         ("C-x C-d" .   helm-browse-project)
         ("C-x C-f" .   helm-find-files)
         ("C-x b" .     helm-mini)
         ("C-x r b" .   helm-filtered-bookmarks)
         ("C-x c b" .   helm-chrome-bookmarks)
         ("M-x" .       helm-M-x)
         ("M-y" .       helm-show-kill-ring)
         ("M-g a" .     helm-do-grep-ag)
         ([remap jump-to-register] . helm-register)
         ([remap list-buffers]     . helm-buffers-list)
         ([remap dabbrev-expand]   . helm-dabbrev)
         ([remap find-tag]         . helm-etags-select)
         ([remap xref-find-definitions] . helm-etags-select))
)

(provide 'lv-helm)
