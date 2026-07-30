autoload -Uz compinit promptinit
compinit
promptinit

PROMPT='%B%F{green}%n@%m%f:%F{blue}%~%f$ %b'

export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$/var/lib/flatpak/exports/bin:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

eval "$(starship init zsh)"
