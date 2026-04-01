#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$/var/lib/flatpak/exports/bin:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

#PS1='[\u@\h \W]\$ '
PS1='\[\e[1;32m\]\u@\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\]\$ '
