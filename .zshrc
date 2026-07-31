autoload -Uz compinit promptinit
compinit
promptinit

PROMPT='%B%F{green}%n@%m%f:%F{blue}%~%f$ %b'

export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$/var/lib/flatpak/exports/bin:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

eval "$(starship init zsh)"
