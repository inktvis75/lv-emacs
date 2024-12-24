# My Emacs Configuration

This repository contains my personal Emacs configuration, tailored to enhance
productivity and streamline workflows.  It includes custom settings,
keybindings, and additional Emacs Lisp scripts to optimize the editing
experience.  The configuration is based on the work from [Hadi
Timachi](https://codeberg.org/haditim/dotemacs).

Feel free to use and adapt it to suit your own needs! 

# Installation

Install the dependencies as described in the
[REQUIREMENTS](https://github.com/inktvis75/lv-emacs/blob/main/REQUIREMENTS.md).

Clone the repository:

```
git clone https://github.com/inktvis75/lv-emacs.git ~/.config/emacs
```

Add the following lines to your ~/.bashrc:

```
export BASH_SILENCE_DEPRECATION_WARNING=1
[ -n "$EAT_SHELL_INTEGRATION_DIR" ] && \
  source "$EAT_SHELL_INTEGRATION_DIR/bash"
```

And start Emacs.

After packages are installed and Emacs is loaded, run `M-x
nerd-icons-install-fonts`, repeat the procedure for
`all-the-icons-install-fonts` and restart Emacs for icons to show up.

Use `treesit-install-language-grammar` to install the language support.
