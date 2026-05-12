#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f "$HOME/.config/dircolors" ] && eval $(dircolors "$HOME/.config/dircolors")

PS1='\[\e[38;5;183;1m\]\u\[\e[0;97m\]@\[\e[38;5;111;1m\]\H\[\e[37;2m\]:\[\e[0;1;38;5;218;4m\]\w\n\[\e[24;38;5;250;2m\]\\$\[\e[0m\] '

set -o vi

# eval "$(/usr/bin/fzf --bash)"

bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'


alias rm="rm -I";
alias cp="cp -i";
alias mv="mv -i";

alias ..="cd .."
alias ...="cd ../.."
alias ls='ls -F --color=auto --group-directories-first'
alias la="ls -A"
alias ll="ls -al"

alias grep="grep --color=auto"
alias less="less -i -F"
alias free="free -h"
alias lsblk="lsblk -o name,mountpoints,type,size"

alias minecraft='hmcl'
