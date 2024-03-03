export MAIN_DIR=/opt
export WAPP_DIR="$MAIN_DIR/app-webgo"

SAPP_DIR=${MAIN_DIR}/app-shell

# 环境变量
export SAPP_DIR=${SAPP_DIR}
export PATH=$PATH:${SAPP_DIR}/bin

export COLOR_H1_0='\e[1;35;42m'
export COLOR_H1_1='\e[4;30;46m'
export COLOR_H2_0='\e[1;35;40m'
export COLOR_H2_1='\e[1;32;40m'
export COLOR_END='\e[0m'

export GITUL=http://github.opsp.eu.org/

# default programe
export EDITOR='/usr/bin/vim'

# xbps
if [ "$(command -v xbps-install)" ]; then
  alias xbps-install='sudo xbps-install -S && sudo xbps-install'
fi


# theme =======================================================================================================================
# starship
if [ "$(command -v starship)" ]; then
  eval "$(starship init zsh)"
fi

# sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
# sudo chmod +x /usr/local/bin/oh-my-posh
# if [ "$(command -v oh-my-posh)" ]; then
#   eval "$(oh-my-posh init zsh --config ~/.config/zsh/my-night-owl.omp.json )"
# fi

# 命令设置 =======================================================================================================================
HISTTIMEFORMAT="[%m-%d %H:%M] "

alias rmdel='rm'
alias rm='adfadfadsfasdf'

# ls命令
if [ "$(command -v exa)" ]; then
    alias ll='exa -l --color always -a -s type --icons'
    alias ls='exa -s type --icons'
    alias tree='exa -T --icons -L 2 -s type'
    alias lst='exa -T --icons -L 2 -s type'
    alias lln='exa -l --color always -a -s type '
    alias lsn='exa -s type'
fi
# if [ "$(command -v lsd)" ]; then
#     alias lsd='lsd -Al --group-dirs first'
#     alias lsa='lsd -AXl --group-dirs first'
#     alias lst='lsd --tree --group-dirs first --depth 2'
# fi
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
if [ "$(command -v trash)" ]; then
    alias rm='trash'
    alias rml='trash-list'
fi

# conda环境变量 ==================================================================================================================
if [ "$(command -v condazshstart)" ]; then
    alias condainit='source condazshstart'
fi

# rust环境变量 ==================================================================================================================
export CARGO_HTTP_MULTIPLEXING=false
export CARGO_HOME=${SAPP_DIR}/_env_make/rust-cargo
export RUSTUP_HOME=${SAPP_DIR}/_env_make/rust-main
CARGO=${SAPP_DIR}/_env_make/rust-cargo/bin
# . "${SAPP_DIR}/_env_make/rust-cargo/env"

# completion
# sudo ln -s ${SAPP_DIR}/zoxide/completions/_zoxide /usr/share/zsh/site-functions/
# source ${SAPP_DIR}/zoxide/completions/zoxide.bash
# sudo ln -s $SAPP_DIR/lsd/autocomplete/_lsd /usr/share/zsh/site-functions

alias supervisorctl="$WAPP_DIR/supervisord/supervisord ctl -s http://127.0.0.1:18080 -u tom -P  tom-tom@"

