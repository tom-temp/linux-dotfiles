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
xbps-install fuse curl wget vim exa zoxide procs dust glow vsv
xbps-install bottom

# zsh environment
xbps-install starship exa lsd zoxide ripgrep procs dust fd zsh viu

mkdir -p ~/.config/zsh
git clone --depth=1 https://github.com/zdharma-continuum/zinit.git ~/.config/zsh/zinit
touch ~/.config/path_custom.zsh

# gpu
xbps-install nvtop python3-pipx
pipx install rich-cli
# app download ---------------------------------------------------------------------------------------------

## lfs
wget https://dystroy.org/lfs/download/x86_64-linux/lfs -O $SAPP_DIR/lfs
chmod +x $SAPP_DIR/lfs

## dns-top
apk add dnstop
