# emacs like keybindings
bindkey -e

# del -> delete character
bindkey "[3~" delete-char

# CTRL-a -> jump to the beginning of the line
bindkey "OH" beginning-of-line

# CTRL-e -> jump to the end of line
bindkey "OF" end-of-line

# ALT-<Right> -> forward word
bindkey ";5C" emacs-forward-word
bindkey "OC" emacs-forward-word

# ALT-<Left> -> backward word
bindkey ";5D" emacs-backward-word
bindkey "OD" emacs-backward-word

# CTRL-B -> kill previous word
bindkey "" backward-kill-word

# ALT-m -> duplicate previous word
bindkey "m" copy-prev-shell-word

# CTRL-^ -> kill to the beginning of the line
bindkey "" backward-kill-line

# CTRL-X_e -> edit command line
autoload edit-command-line && zle -N edit-command-line
bindkey "" edit-command-line

# grml-zsh {{{
# CTRL-z -> reexecute background job
bindkey -s "" "fg\n"
# use the vi navigation keys (hjkl) besides cursor keys in menu completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom
# }}}

# vim: ft=zsh foldmethod=marker
