
export GITPROXY="https://"
export Make_env="$HOME/_env_make"

mkdir -p ${Make_env}
mkdir -p ~/.config/profile_dir
mkdir -p ~/.tmp
cd    ~/.tmp

wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz -O go-package.tar.gz
tar -C ${Make_env} -xzf go-package.tar.gz

# color ----------------------------------------------------------------------------
export COLOR_H1_0='\e[1;35;42m'
export COLOR_H1_1='\e[4;30;46m'
export COLOR_H2_0='\e[1;35;40m'
export COLOR_H2_1='\e[1;32;40m'
export COLOR_END='\e[0m'

# environment ----------------------------------------------------------------------------
export PATH=$PATH:${Make_env}/go/bin
echo "export GOlang_env=$Make_env"            >> ~/.config/profile_dir/golang.profile
echo 'export PATH=$PATH:${GOlang}/go/bin'     >> ~/.config/profile_dir/golang.profile

echo "go long has installed"
go version
# config ----------------------------------------------------------------------------
go env -w GO111MODULE=on

echo "是否设置阿里镜像?(n/y)"
read set_proxy
if [[ $set_proxy == 'y' ]]
then
    echo "设置goproxy--------------------------"
    # go env -w GOPROXY=https://goproxy.io
    go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/
    go env -w GOPRIVATE="git@git.wbctyun.cn"
fi

echo "是否设cache文件夹到${Make_env}下?(n/y)"
read set_cache
if [[ $set_cache == 'y' ]]
then
    echo "设置cache目录--------------------------"
    # go env -w GOPROXY=https://goproxy.io
    go env -w GOCACHE="${Make_env}/go_cache"
    go env -w GOPATH="${Make_env}/go_path"
    go env -w GOMODCACHE="${Make_env}/go_mod_cache"
fi

echo "是否安装xcaddy?(n/y)"
read install_xcaddy
if [[ $install_xcaddy == 'y' ]]
then
    echo "选择linux架构：1.amd64, 2.arm64. (1/2)"
    read xcaddy_arch_s
    case "$xcaddy_arch_s" in
        1) export xcaddy_arch="amd64" ;;
        2) export xcaddy_arch="arm64" ;;
        *) export xcaddy_arch="amd64" && echo "无选择，默认设置为${COLOR_H1_0}arm64${COLOR_END}";;
    esac
    mkdir ~/.local/xcaddy
    cd    ~/.local/xcaddy
    wget "${GITPROXY}https://github.com/caddyserver/xcaddy/releases/latest/download/xcaddy_0.3.1_linux_${xcaddy_arch}.tar.gz"
    tar -xf xcaddy_0.3.1_linux_${xcaddy_arch}.tar.gz

    # CGO_ENABLED=0 GOOS=linux GOARCH=arm64 \
    # ./xcaddy build \
    # --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive \
    # --with github.com/caddy-dns/cloudflare
fi




