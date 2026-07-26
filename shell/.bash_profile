# Login Bash environment.

path_prepend() {
    case ":$PATH:" in
        *:"$1":*) ;;
        *) PATH="$1${PATH:+:$PATH}" ;;
    esac
}

[[ -d "$HOME/.local/bin" ]] && path_prepend "$HOME/.local/bin"
[[ -d "$HOME/.local/sbin" ]] && path_prepend "$HOME/.local/sbin"
export PATH
unset -f path_prepend

[[ -r "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export npm_config_cache="$XDG_CACHE_HOME/npm"
export OLLAMA_MODELS="$XDG_DATA_HOME/ollama/models"

export HISTFILE="$XDG_STATE_HOME/bash/history"
export HISTIGNORE="lf:cd ..:pwd:ls:exit"

export CALCHISTFILE="$XDG_CACHE_HOME/calc_history"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

export SAL_USE_VCLPLUGIN=gtk3
export QT_QPA_PLATFORMTHEME=qt6ct
export _JAVA_AWT_WM_NONREPARENTING=1

if [[ -d /usr/share/pico-sdk ]]; then
    export PICO_SDK_PATH=/usr/share/pico-sdk
fi

