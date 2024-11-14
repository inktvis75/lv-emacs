(use-package pdf-tools
  :straight t
  :defer nil
  :commands (pdf-view-mode pdf-tools-install)
  :mode ("\\.[pP][dD][fF]\\'" . pdf-view-mode)
  :load-path "site-lisp/pdf-tools/lisp"
  :magic ("%PDF" . pdf-view-mode)
  :config
  ;; install pdf-tools
  (pdf-tools-install :no-query)
  ;; open pdfs scaled to fit page
  (setq-default pdf-view-display-size 'fit-page)
  ;; automatically annotate highlights
  (setq pdf-annot-activate-created-annotations t)
  (define-pdf-cache-function pagelabels)
  :hook ((pdf-view-mode-hook . (lambda () (display-line-numbers-mode -1)))
         (pdf-view-mode-hook . pdf-tools-enable-minor-modes))
)

(use-package pdf-view-restore
  :after pdf-tools
  :straight t
  :config
  :hook (pdf-view-mode . pdf-view-restore-mode)
)

(provide 'lv-pdf)
