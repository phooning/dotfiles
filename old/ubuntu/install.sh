#!/bin/sh

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb

# Backup fstab
sudo cp /etc/fstab /etc/fstab.old

# PPA packages
packages=(
  snapd
  vim
  zsh
  tmux
  qbittorrent
  youtube-dl
  ffmpeg
  nodejs
  npm
  python3-pip
  cpu-checker
  qemu-kvm
  libvirt-clients
  libvirt-daemon-system
  bridge-utils
  virt-manager
)

for i in "${packages[@]}"
do
  sudo apt-get install -y $i
done

# Snap packages
snap_packages=(
  keepassxc
  pycharm-professional --classic
  webstorm --classic
  discord
  android-studio --classic
)

for i in "${snap_packages[@]}"
do
    sudo snap install $i
done

# Change shell to zsh
chsh -s $(which zsh)
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -L git.io/antigen > antigen.zsh

# tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update && apt-get install yarn

# Install NPM packages
npm_packages=(
    pug
    react-native-cli
)

for i in "${npm_packages[@]}"
do
    npm install -g $i
done

# Install pip packages
pip_packages=(
    --upgrade pip
    jupyter
    Markdown
    pandas
    pygame
    scikit-image
    scippy
    xgboost
    seaborn
    tweepy
    virtualenv
    ipython
    ipython-genutils
    numpy
    matplotlib
    sympy
    nose
    psutil
    pygit2
    pyuv
    i3ipc
    powerline-status
    jedi
    percol
    aiodns
    elasticsearch
    geopy
    cchardet
    aiohttp_socks
    schedule
)

for i in "${pip_packages[@]}"
do
    pip3 install $i
done

# zplugin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# check kvm
egrep -c '(vmx|svm)' /proc/cpuinfo