export MAIN_DIR=/opt

export COLOR_H1_0='\e[1;35;42m'
export COLOR_H1_1='\e[4;30;46m'
export COLOR_H2_0='\e[1;35;40m'
export COLOR_H2_1='\e[1;32;40m'
export COLOR_END='\e[0m'

export GITULS=http://github.opsp.eu.org/

# 命令设置
HISTTIMEFORMAT="[%m-%d %H:%M] "

# 环境变量
MAIN_DIR=/opt
MAPP_DIR=/opt/shell-app

export PATH=$PATH:${MAPP_DIR}/bin
# ls命令
if [ "$(command -v exa)" ]; then
    alias ll='exa -l --color always -a -s type'
    alias ls='exa'
    alias tree='exa -T'
fi
if [ "$(command -v exa)" ]; then
    alias lsd='lsd'
    alias lsa='lsd -aX --group-dirs first'
    alias lss='lsd -laX --group-dirs first'
    alias lst='lsd --tree --group-dirs first --depth 2'

fi
if [ "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh)"
fi
# app alias

alias grep='rg'
alias psui='procs'
alias du='dust'
alias rm='trash'
alias rml='trash-list'

# rust环境变量
export CARGO_HOME=${MAPP_DIR}/_env_make/rust-cargo
export RUSTUP_HOME=${MAPP_DIR}/_env_make/rust-main
CARGO=${MAPP_DIR}/_env_make/rust-cargo/bin
CARGO_HTTP_MULTIPLEXING=false
. "${MAPP_DIR}/_env_make/rust-cargo/env"

# completion
# ln -s ${MAPP_DIR}/zoxide/completions/_zoxide /usr/share/zsh/site-functions/
# source ${MAPP_DIR}/zoxide/completions/zoxide.bash
# sudo ln -s $MAPP_DIR/lsd/autocomplete/_lsd /usr/share/zsh/site-functions

alias supervisorctl='/opt/local-app/supervisord/supervisord ctl -s http://127.0.0.1:18080 -u tom -P 111'

