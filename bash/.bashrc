# 环境变量
export PATH=$PATH:~/.local/bin

# protmp
if [ "$(command -v starship)" ]; then
    eval "$(starship init bash)"
fi
export PS0='\n\e[100m#==========[out]==========#\[\e[0m\]\n'
HISTTIMEFORMAT="[%m-%d %H:%M] "
# default programe
export EDITOR='/usr/bin/vim'

#==============================================
# plugs
#==============================================
# BLE.SH
source ~/.local/share/blesh/ble.sh

#==============================================
# alias
#==============================================
# xbps
if [ "$(command -v xbps-install)" ]; then
  alias xbps-install='sudo xbps-install -S && sudo xbps-install'
fi

# atuin
if [ "$(command -v atuin)" ]; then
    export ATUIN_NOBIND="true"
    eval "$(atuin init zsh)"
    bind -x '"\C-f": __atuin_history'
fi

alias rmdel='rm'
# alias rm='adfadfadsfasdf'

# ls命令
if [ "$(command -v exa)" ]; then
    alias ll='exa -l --color always -a -s type --icons'
    alias ls='exa -s type --icons'
    alias tree='exa -T --icons -L 2 -s type'
    alias lst='exa -T --icons -L 2 -s type'
    alias lln='exa -l --color always -a -s type '
    alias lsn='exa -s type'
fi
if [ "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh)"
fi
if [ "$(command -v rg)" ]; then
    alias grep='rg'
fi
if [ "$(command -v procs)" ]; then
    alias psui='procs'
fi
if [ "$(command -v dust)" ]; then
    alias du='dust'
fi
if [ "$(command -v gtrash)" ]; then
    alias rm='gtrash put'
    alias rml='gtrash find /tmp --rm && gtrash f'
fi

if [ "$(command -v yazi)" ]; then
    function ya() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            cd -- "$cwd"
        fi
        rmdel -f -- "$tmp"
    }
fi


