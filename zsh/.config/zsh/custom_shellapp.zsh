export MAIN_DIR=/opt
MAPP_DIR=${MAIN_DIR}/shell-app

# 环境变量
export MAPP_DIR=${MAPP_DIR}
export PATH=$PATH:${MAPP_DIR}/bin

export COLOR_H1_0='\e[1;35;42m'
export COLOR_H1_1='\e[4;30;46m'
export COLOR_H2_0='\e[1;35;40m'
export COLOR_H2_1='\e[1;32;40m'
export COLOR_END='\e[0m'

export GITULS=http://github.opsp.eu.org/

# default programe
# export EDITOR='/usr/bin/vim'


# oh-my-posh
# sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
# sudo chmod +x /usr/local/bin/oh-my-posh
if [ "$(command -v oh-my-posh)" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/zsh/my-night-owl.omp.json )"
fi

# 命令设置
HISTTIMEFORMAT="[%m-%d %H:%M] "

# ls命令
if [ "$(command -v exa)" ]; then
    alias ll='exa -l --color always -a -s type'
    alias ls='exa'
    alias tree='exa -T'
fi
if [ "$(command -v lsd)" ]; then
    alias lsd='lsd'
    alias lsa='lsd -aX --group-dirs first'
    alias lss='lsd -laX --group-dirs first'
    alias lst='lsd --tree --group-dirs first --depth 2'

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
if [ "$(command -v trash)" ]; then
    alias rm='trash'
    alias rml='trash-list'
fi

# rust环境变量
export CARGO_HOME=${MAPP_DIR}/_env_make/rust-cargo
export RUSTUP_HOME=${MAPP_DIR}/_env_make/rust-main
CARGO=${MAPP_DIR}/_env_make/rust-cargo/bin
CARGO_HTTP_MULTIPLEXING=false
# . "${MAPP_DIR}/_env_make/rust-cargo/env"

# completion
# sudo ln -s ${MAPP_DIR}/zoxide/completions/_zoxide /usr/share/zsh/site-functions/
# source ${MAPP_DIR}/zoxide/completions/zoxide.bash
# sudo ln -s $MAPP_DIR/lsd/autocomplete/_lsd /usr/share/zsh/site-functions

alias supervisorctl='/opt/local-app/supervisord/supervisord ctl -s http://127.0.0.1:18080 -u tom -P 111'

