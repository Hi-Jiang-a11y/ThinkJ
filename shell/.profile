[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:${PATH}"
[ -d "$HOME/.local/sbin" ] && export PATH="$HOME/.local/sbin:${PATH}"

[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

export EDITOR=nvim
export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en"
export LC_ALL="en_US.UTF-8"
export BROWSER="firefox"
export VISUAL="/usr/bin/nvim"

export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"


export HISTFILE="$XDG_STATE_HOME/bash/history"
export HISTIGNORE="lf:cd ..:pwd:ls:exit"

export CALCHISTFILE="$XDG_CACHE_HOME/calc_history"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

export QT_QPA_PLATFORMTHEME=gtk3 # qt theme
export QT_STYLE_OVERRIDE=adwaita-dark # qt theme
export SAL_USE_VCLPLUGIN=gtk3

export _JAVA_AWT_WM_NONREPARENTING=1 # fix java blank window in xwayland-satellite

