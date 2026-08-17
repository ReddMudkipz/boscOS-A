autoload -Uz compinit promptinit
compinit
promptinit

PROMPT='%B%F{green}%n@%m%f:%F{blue}%~%f$ %b'

export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$/var/lib/flatpak/exports/bin:$PATH"
export PATH="$/HOME/.local/bin:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

function y() { # matching yazi directory when quitting it. Press q to match, Q to stay where it was before
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

zstyle ':completion:*' menu select # for arrow key interface. Press tab twice

# History
HISTSIZE=50000
HISTFILE=~/.zsh_history # location of history
SAVEHIST=50000
setopt EXTENDED_HISTORY # set command start time
setopt SHARE_HISTORY # share history across all active terminals

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"