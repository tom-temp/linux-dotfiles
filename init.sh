# update
cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
sed -i 's|https://repo-default.voidlinux.org|https://mirrors.tuna.tsinghua.edu.cn/voidlinux|g' /etc/xbps.d/*-repository-*.conf
xbps-install -S
xbps-remove -R grub-i386-efi grub-x86_64-efi grub efibootmgr libefivar lvm2 os-prober thin-provisioning-tools
# config
xbps-install stow git
git clone --depth=1 https://github.com/tom-temp/linux-dotfiles.git ~/dotfiles
git -C ~/dotfiles pull
# windows
# git config --global core.autocrlf input

# voidlinux
xbps-install fuse curl wget vim exa zoxide procs dust glow vsv unzip
xbps-install bottom

# zsh environment
xbps-install starship exa zoxide ripgrep procs dust fd zsh atuin

mkdir -p ~/.config/zsh
git clone --depth=1 https://github.com/zdharma-continuum/zinit.git ~/.config/zsh/zinit
touch ~/.config/path_custom.zsh

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p ~/.local/bin/
ln -s ~/.config/tmux/layout.default.sh ~/.local/bin/tm
chmod +x ~/.config/tmux/layout.default.sh


###############################################################################
# yazi
###############################################################################
xbps-install viu jq atool

sudo mkdir -p ~/.config/yazi/plugins
git clone https://github.com/DreamMaoMao/keyjump.yazi.git ~/.config/yazi/plugins/keyjump.yazi
git clone https://github.com/Reledia/glow.yazi.git ~/.config/yazi/plugins/glow.yazi

xbps-install void-repo-nonfree
sudo cp /usr/share/xbps.d/10-repository-nonfree.conf /etc/xbps.d
xbps-install unrar

## 临时方法
sudo mkdir -p /opt/app-shell/bin
sudo chmod 777 /opt/app-shell -R
cd /opt/app-shell/
wget https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip
unzip yazi-x86_64-unknown-linux-gnu.zip
sudo cp yazi-x86_64-unknown-linux-gnu/yazi bin/
rm -r yazi-x86_64-unknown-linux-gn
rm yazi-x86_64-unknown-linux-gnu.zip

# gpu
xbps-install nvtop python3-pipx
pipx install rich-cli
# app download ---------------------------------------------------------------------------------------------

## lfs
wget https://dystroy.org/lfs/download/x86_64-linux/lfs -O $SAPP_DIR/lfs
chmod +x $SAPP_DIR/lfs

## gtrash
cd /opt/app-shell/
wget https://github.com/umlx5h/gtrash/releases/latest/download/gtrash_Linux_x86_64.tar.gz
tar -xf gtrash_Linux_x86_64.tar.gz
sudo cp gtrash ./bin
rm gtrash gtrash_Linux_x86_64.tar.gz


# setting ---------------------------------------------------------------------------------------------







# ALPINE
## dns-top
apk add dnstop

## yazi
apk add viu poppler coreutils jq unar
apk add yazi glow --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing

mkdir -p ~/.config/yazi/plugins
git clone https://github.com/DreamMaoMao/keyjump.yazi.git ~/.config/yazi/plugins/keyjump.yazi
git clone https://github.com/Reledia/glow.yazi.git ~/.config/yazi/plugins/glow.yazi

## trash1 go语言
## https://github.com/umlx5h/gtrash
mkdir -p ~/.local/share/Trash

## trash zsh
if [ "$(command -v gtrash)" ]; then
    alias rm='gtrash put'
    alias rml='gtrash f'
fi
