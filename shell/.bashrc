# Interactive Bash settings.
[[ $- != *i* ]] && return

export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
[[ -r "$INPUTRC" ]] && bind -f "$INPUTRC"

[[ -r "$HOME/.config/dircolors" ]] &&
    eval "$(dircolors "$HOME/.config/dircolors")"

PS1='\[\e[38;5;183;1m\]\u\[\e[0;97m\]@\[\e[38;5;111;1m\]\H\[\e[37;2m\]:\[\e[0;1;38;5;218;4m\]\w\n\[\e[24;38;5;250;2m\]\\$\[\e[0m\] '

set -o vi

# Fuzzy shell navigation and history search.
eval "$(fzf --bash)"

# Smart directory jumping: `z query` and interactive `zi`.
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
fi

bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -F --color=auto --group-directories-first'
alias la='ls -A'
alias ll='ls -al'

alias grep='grep --color=auto'
alias less='less -i -F'
alias free='free -h'
alias lsblk='lsblk -o name,mountpoints,type,size'

alias minecraft='hmcl'
