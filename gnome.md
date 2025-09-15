## 语言
```
vim /etc/locale.gen

#取消en_US.UTF-8 UTF-8和zh_CN.UTF-8的注释

locale-gen

vim /etc/locale.conf
写入 LANG=en_US.UTF-8
```
重启



## 安装字体与显卡驱动
```sh
sudo pacman -S wqy-zenhei  noto-fonts-emoji ttf-hack-nerd ttf-liberation openssh vim linux-headers # noto-fonts
sudo pacman -S mesa mesa-utils
sudo pacman -S vulkan-intel lib32-vulkan-intel vulkan-tools # lib32-vulkan-virtio
sudo pacman -S libvdpau-va-gl  #将ffmpeg对nvidia的以来转移到intel gpu上
sudo pacman -S intel-gpu-tools # gputop 查看gpu使用
# sudo pacman -S xf86-video-intel intel-media-driver

# 虚拟机下安装驱动
sudo pacman -S  open-vm-tools xf86-input-vmmouse mesa vulkan-mesa-layers lib32-vulkan-mesa-layers vulkan-tools xf86-video-vesa
systemctl enable sshd vmtoolsd vmware-vmblock-fuse

# 查看vulkan与opengl输出
vulkaninfo
eglinfo -B
glxinfo | grep "OpenGL renderer"
```

## 编辑sudo权限
```sh
EDITOR=vim visudo

vim /etc/pacman.conf
[archlinuxcn]
Server = https://repo.archlinuxcn.org/$arch

pacman -Sy
pacman -S archlinuxcn-keyring 
pacman -S paru 
pacman -S ttf-maplemono
pacman -S ttf-maplemono-nf-unhinted
pacman -S ttf-maplemono-nf-cn-unhinted
```


# 桌面环境
```sh
pacman -S gnome-desktop gdm  gnome-control-center ghostty #  foot
pacman -S  flatpak gnome-software
systemctl start gdm
systemctl enable gdm

pacman -S gvfs-smb menulibre timeshift 
paru -S nautilus-hide
# xdg-user-dirs-update
```
- gvfs-smb 文件夹smba支持
- menulibre 想隐藏的图标
- timeshift 快照服务


## 安装声音与网络配置固件 与 服务

```
sudo pacman -S sof-firmware alsa-firmware alsa-ucm-conf
sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber

systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user start pipewire pipewire-pulse wireplumber
# 图形界面
sudo pacman -S pavucontrol 
sudo pacman -S network-manager-applet dnsmasq
```
- 设置跃点
> 启动安装的软件或输入nm-connection-editor
> 跃点需手动设置为100,默认的-999会导致网络速率异常

## 蓝牙
```sh
sudo pacman -S bluez
lsmod | grep btusb
sudo systemctl enable --now bluetooth.service
```

## 桌面软件
```
sudo pacman -S mission-center gnome-text-ditor gnome-disk-utility gnome-clocks gnome-calculator loupe snapshot showtime file-roller zen-browser zen-browser-i18n-zh-cn gst-plugin-pipewire gst-plugins-good amberol gnome-calendar
paru -S microsoft-edge-stable-bin
paru -S 
paru -S appimagelauncher
```

- mission-center 类似win11的任务管理器
#gnome-text-ditor记事本
#gnome-disk-utility磁盘管理
#gnome-clocks时钟
#gnome-calculator计算器
#loupe图像查看
#snapshot相机，摄像头
#showtime 极度简洁的视频播放器，要强大功能可以用MPV,不推荐使用VLC
#file-roller解压
#gst-plugin-pipewire gst-plugins-good gnome截图工具自带的录屏，需登出
#amberol 音乐播放器

- zen-browser zen-browser-i18n-cn 基于firefox的浏览器和cn语言包
  - zen浏览器一定要在设置>zen模组里面安装transparent zen模组，可以获得特别流畅的动画效果

### 未安装
#evince 通用文件查看，比如pdf等
#baobab磁盘使用情况分析工具，
#fragments是符合gnome设计理念的种子下载器
#foliate 电子书阅读器

## sublime
> https://blog.csdn.net/yelon_/article/details/130831525

1. 下载 Sublime Text 4143
2. 二进制编辑器bless打开
3. 807805000f94c1，替换为c64005014885c9


## flap 商店
- gradia
- refine

- gradia编辑截图使用方法
可以对截图进行一些简单的添加文字、马赛克、图表、背景之类的操作
设置自定义快捷键的时候命令写：
```
flatpak run be.alexandervanhee.gradia --screenshot=INTERACTIVE
```
- refine 分数缩放 ，可变刷新率

## open in any terminal

[GitHub - Stunkymonkey/nautilus-open-any-terminal](https://github.com/Stunkymonkey/nautilus-open-any-terminal)

这是一个在文件管理器“右键在此处打开终端”的功能

- 如果用的是ghostty
```
sudo pacman -S nautilus-python
```
- 其他终端仿真器
```
yay -S nautilus-open-any-terminal 
```
```
sudo glib-compile-schemas /usr/share/glib-2.0/schemas 
```
```
sudo pacman -S dconf-editor
```
```
修改配置，路径为/com/github/stunkymonkey/nautilus-open-any-terminal
```
- 重载nautilus
```
nautilus -q 
```

# 美化
sudo pacman -S  gnome-tweaks

## 拓展
⚠️ 警告：扩展在gnome桌面环境大版本更新的时候大概率会大面积失效，如果出现gnome桌面环境的更新，一定要先关闭所有扩展，谨慎行事
从商店安装蓝色的扩展管理器
flatpak 商店安装 ExtensionManager

1. input method panel 输入法拓展
2. AppIndicator and KStatusNotifierItem Support 状态上显示后台应用
3. caffeine 防止熄屏
4. lock keys 显示大写锁定和小键盘锁定。设置里把指示器风格改成show/hide cap-locks only
5. clipboard indicator 剪贴板历史
6. GNOME Fuzzy App Search 模糊搜索
7. steal my focus window 如果打开窗口时窗口已经被打开则置顶
8. tiling shell
  - 窗口平铺，tilingshell是用布局平铺,另一个叫forge是hyprland那种自动平铺但是很卡。推荐用tilingshell，记得自定义快捷键，我快捷键是super+w/a/s/d对应上下左右移动窗口，Super+Alt+w/a/s/d对应上下左右扩展窗口，super+c取消平铺。⚠️ 一定要取消智能边角弧度
9. color picker
10. vitals 系统资源
11. dask to dock
12. emoji copy
13. blur my shell 透明全任务
14. Arch Linux Updates Indicator 在面板上显示一个和arch更新相关的图标
15. quick close in overview  在概览里面不用点窗口右上角的叉关闭窗口了，而是使用鼠标中键
16. bottom overview 鼠标滑到屏幕底部边缘激活概览

## 快捷键
右键桌面打开设置，选择键盘>查看及自定义快捷键
我的配置：

* 导航
```
super+shift+数字键 #将窗口移到工作区
super+shift+A/D #将窗口左右移动工作区
Super+数字键 #切换工作区
gnome默认super+滚轮上下可以左右切换工作区
alt+tab #切换应用程序
super+M #隐藏所有正常窗口
alt+` #在应用程序的窗口之间切换窗口
```
* 截图
```
ctrl+alt+A #交互式截图
```
- 打字
```
禁用快捷键
在fcitx5的configtool里面设置super+space切换输入法
```
 * 无障碍
```
全部backspace退格键禁用
```
* 窗口
```
super+Q #关闭窗口
super+F #切换最大化
super+alt+F #切换全屏
```
* 系统
```
ctrl+super+S #打开快速设置菜单
super+G #显示全部应用
```
* 自定义快捷键<快捷键>   <命令>
```
super+B   zen
super+T   ghostty
ctrl+alt+S    missioncenter
super+E   nautilus
super+shift+S   flatpak run be.alexandervanhee.gradia --screenshot=INTERACTIVE
```

# 输入法

### fcitx5
```
sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-mozc
```
mozc是g谷歌日语输入法的开源版本
- 安装gnome扩展：input method panel
https://extensions.gnome.org/extension/261/kimpanel/
- 在fcitx5配置里面添加输入法，没有的话登出重新载入一次
- 编辑环境变量
```bash
sudo vim /etc/environment

GTK_IM_MODULE=fcitx 
QT_IM_MODULE=fcitx 
XMODIFIERS=@im=fcitx
```
重启电脑


#### wps用不了fcitx5
由于wps自身的问题，我们需要手动设置变量：
- 文字 (Writer): `/usr/bin/wps`
- 表格 (Spreadsheets): `/usr/bin/et`
- 演示 (Presentation): `/usr/bin/wpp`
```
export XMODIFIERS=@im=fcitx 
export QT_IM_MODULE=fcitx 
export GTK_IM_MODULE=fcitx
```

# KVM
```bash
sudo pacman -S  qemu-full virt-manager
sudo systemctl enable --now libvirtd
sudo virsh net-start default #开启nat网络
sudo virsh net-autostart default #自动启动nat网络
sudo usermod -a -G libvirt $(whoami)
sudo vim /etc/libvirt/qemu.conf
```
```conf
#修改
user = "tom"
group = "libvirt"
```
```sh
sudo systemctl restart libvirtd
# 零时开启嵌套虚拟化
modprobe kvm_intel nested=1
# 永久生效
sodu vim /etc/modprobe.d/kvm_intel.conf
## 写入
options kvm_intel nested=1
# 重新生成
sudo mkinitcpio -P
```


## 显卡直通

1. 确认iommu是否开启，有输出说明开启
```
sudo dmesg | grep -e DMAR -e IOMMU
```

2. 获取显卡的硬件id，如果是显卡所在group的所有设备的id都记下。如果group里有cpu的话去看wiki。
```
for d in /sys/kernel/iommu_groups/*/devices/*; do 
    n=${d#*/iommu_groups/*}; n=${n%%/*}
    printf 'IOMMU Group %s ' "$n"
    lspci -nns "${d##*/}"
done
```

3. 隔离GPU
```bash
sudo vim /etc/modprobe.d/vfio.conf
options vfio-pci ids=10de:25a9

cat /etc/mkinitcpio.conf
MODULES=(vfio_pci vfio vfio_iommu_type1)
HOOKS=(... modconf ...)
HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block filesystems fsck)

sudo mkinitcpio -P
```

4. 安装和配置ovmf
```bash
sudo pacman -S edk2-ovmf
sudo vim /etc/libvirt/qemu.conf

nvram = [
	"/usr/share/ovmf/x64/OVMF_CODE.fd:/usr/share/ovmf/x64/OVMF_VARS.fd"
]
```

# shell
```sh
sudo pacman -S pacman-contrib havn bluetui stew fnt
```
- pacman-contrib 是pacman的一些小工具 pactree, pacsearch checkupdates
- havn    #端口扫描
- bluetui #蓝牙管理
- stew    #github二进制安装
- fnt     #适用于字体的字体管理器

```sh
sudo pacman -S oh-my-posh curl wget ripgrep fd zsh atuin stow # git
sudo pacman -S exa zoxide procs dust glow hexyl
sudo pacman -S bottom tmux fastfetch
 
```

倒入配置
```bash
git clone --depth=1 https://github.com/tom-temp/linux-dotfiles.git ~/dotfiles
# git -C ~/dotfiles pull
cd ~/dotfiles
stow vim

# zsh
mkdir -p ~/.config/zsh
git clone --depth=1 https://github.com/zdharma-continuum/zinit.git ~/.config/zsh/zinit
stow zsh_gnome

# tmux
mkdir -p ~/.local/bin/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd ~/dotfiles
stow tmux
ln -s ~/.config/tmux/layout.default.sh ~/.local/bin/tm
chmod +x ~/.local/bin/tm
chmod +x ~/.config/tmux/layout.default.sh


# "配置SSH 公钥"
cd ~
mkdir -p ~/.ssh
echo "# thinkbook" >> ~/.ssh/authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDcyPDkNkkzMfm+yZYGN6jyxAY09xQV8rkngYd7TAlrs tom@tom.tom" >> ~/.ssh/authorized_keys
echo "# conestoga" >> ~/.ssh/authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHxDqMbKbKljkIkaMkn5nezfA4Uziy7TXZymDpTzQgts tom@202404" >> ~/.ssh/authorized_keys
echo "# office365" >> ~/.ssh/authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHxDqMbKbKljkIkaMkn5nezfA4Uziy7TXZymDpTzQgts tom@202404" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6Jxi836pB6Fgw/wHlzPGCGxi002RGHUwaFcmS1CyXMJh5L8YwQacIxTHNR80CZSD/gfxBZww07Z16fyYpQ9m3Bh3Z0Ikv/Pa5VGdJzEoehOijyyo819vVZC5MgYOqxhkQhmNBwPBzTiSonMFGqHuLyW2oIunsXBW4nUtLurLjOO+J1IavQuOJM5jjMeqy3lCyTeXibEdPjOT68hNzfvitj9dzRJ715VnFUSJJOnbr9PYCAelvuRH6xkIHvIG0P4CAhAyXc31S4aV3flv0zF5Or5jbjYbdI6qHp2GbjA393F6JnwkzVnC8/piObCS70BHbzkO0DR5J1aiyd9Nnfhlp ssh-key-2024-04-08" >> ~/.ssh/authorized_keys

# brew
cd ~
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/tom/.profile
```
