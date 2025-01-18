(custom-set-variables
  '(menu-bar-mode nil)
  '(tool-bar-mode nil)
  '(scroll-bar-mode nil)
  '(initial-buffer-choice t)
  '(pixel-scroll-precision-mode t)
  '(frame-title-format nil)
  '(cursor-in-non-selected-windows nil)
  '(font-lock-maximum-decoration nil)
  '(font-lock-maximum-size nil)
  '(x-underline-at-descent-line t)
  '(window-divider-default-right-width 16)
  '(window-divider-default-places 'right-only)
)

(setq package-enable-at-startup nil)
(setq gc-cons-percentage 0.6)
(setq gc-cons-threshold most-positive-fixnum)
(setq native-comp-async-report-warnings-errors 'silent)

;; Encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(provide 'early-init)
