(use-package welcome-dashboard 
    :straight (
    :host github
    :repo "konrad1977/welcome-dashboard"
    :files ("welcome-dashboard.el")
    :ensure t
    :after nerd-icons
    )
    :demand
    :init
    (setq welcome-dashboard-use-nerd-icons t
          welcome-dashboard-longitude 6.0440 
          welcome-dashboard-latitude 53.0825
          welcome-dashboard-path-max-length 75
          welcome-dashboard-use-fahrenheit nil
          welcome-dashboard-min-left-padding 10
          welcome-dashboard-image-file "~/.config/emacs/themes/linvirt-small.png"
          welcome-dashboard-image-width 200
          welcome-dashboard-max-number-of-todos 5
          welcome-dashboard-image-height 169
          welcome-dashboard-title (concat "Welcome " user-full-name )
    )
    :config
    (welcome-dashboard-create-welcome-hook)
)

(provide 'lv-dash)
