apt install sudo curl wget vim eza zoxide procs  glow unzip hexyl du-dust
apt install bottom tmux fastfetch
apt install starship eza zoxide ripgrep fd-find zsh atuin
apt autoremove nano
curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o /usr/bin/bash-preexec.sh

# user
/sbin/usermod -a -G sudo tom
/sbin/usermod -a -G systemd-journal tom
/sbin/usermod -a -G systemd-network tom
chown tom:tom /opt
exit
exit
sudo -i

# config
apt install stow git
git clone --depth=1 https://github.com/tom-temp/linux-dotfiles.git ~/dotfiles
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
# git -C ~/dotfiles pull

# Bash
mv ~/.bashrc ~/bashrc.bac
cd dotfiles
stow vim
stow bash
~/.bash_it/install.sh -a
cp ./bash/.config/theme-bashit/powerline-multiline.base.bash ../.bash_it/themes/powerline-multiline/
cp ./bash/.config/theme-bashit/powerline-multiline.theme.bash ../.bash_it/themes/powerline-multiline/
sed -i '$i'"export BASH_IT_THEME='powerline-multiline'" ~/.bashrc
source ~/.bashrc
bashit disable alias general

###############################################################################
# Tom
###############################################################################
git clone --depth=1 https://github.com/tom-temp/linux-dotfiles.git ~/dotfiles
# git -C ~/dotfiles pull
cd ~/dotfiles
stow vim

# zsh
mkdir -p ~/.config/zsh
git clone --depth=1 https://github.com/zdharma-continuum/zinit.git ~/.config/zsh/zinit
stow zsh
touch ~/.config/path_custom.zsh

# tmux
mkdir -p ~/.local/bin/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd ~/dotfiles
stow tmux
ln -s ~/.config/tmux/layout.default.sh ~/.local/bin/tm
chmod +x ~/.local/bin/tm
chmod +x ~/.config/tmux/layout.default.sh


# brew
cd ~
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/tom/.profile


