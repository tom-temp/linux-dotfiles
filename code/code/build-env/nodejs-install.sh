#!/bin/bash

link_web="https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.xz"
export main_folder="/opt/app-shell/_env_"
export bin_folder="/opt/app-shell/bin"

# 下载解压
wget $link_web -O $main_folder/node.tar.xz
cd $main_folder
tar -xf node.tar.xz
mv node-v* nodejs

# 快捷方式
ln -s $main_folder/nodejs/bin/node $bin_folder/node
ln -s $main_folder/nodejs/bin/npm $bin_folder/npm
ln -s $main_folder/nodejs/bin/npx $bin_folder/npx
npm install -g pnpm
ln -s $main_folder/nodejs/bin/pnpm $bin_folder/pnpm
# 设置仓库
mkdir $main_folder/nodejs-pnpm

cd ~
pnpm config set store-dir      "$main_folder/nodejs-pnpm/pnpm-store"
pnpm config set cache-dir      "$main_folder/nodejs-pnpm/cache"
pnpm config set state-dir      "$main_folder/nodejs-pnpm"
pnpm config set global-dir     "$main_folder/nodejs-pnpm/pnpm-global"
pnpm config set global-bin-dir "$main_folder/nodejs-pnpm/bin"
pnpm config set registry https://registry.npmmirror.com

# react
touch ~/.config/path_custom.zsh
echo 'export PATH=$PATH:'"${main_folder}"'/nodejs-pnpm/bin' >> ~/.config/path_custom.zsh
