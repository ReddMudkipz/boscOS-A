#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$HOME/.config/emacs/bin:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Flatpack shortcuts
alias stremio='flatpak run com.stremio.Stremio/ & disown ; exit'

PS1='[\u@\h \W]\$ '
