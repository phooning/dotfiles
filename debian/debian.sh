#!/bin/sh

## NVIDIA drivers
# dpkg --add-architecture i386
# apt install firmware-linux nvidia-driver nvidia-settings nvidia-xconfig
# sed -i 's|main.*|main contrib non-free|g' /etc/apt/sources.list
# apt-get update && apt-get upgrade
# apt-get dist-upgrade
# apt-get autoremove
# reboot

packages=(
    libavcodec-extra
    libdvdread4
    liblzo2-dev
    liblzo2-2
    libegl1-mesa-dev
    cmake
    pkg-config
    libfreetype6-dev
    libfontconfig1-dev
    net-tools
    xclip
    synaptic
    thunar nemo
    apt-xapian-index
    apparmor-profiles
    samba
    apparmor-utils
    apparmor
    keepassx # Keepass client
    qbittorrent # Client
    libreoffice # Office
    gpodder # Podcasts
    easytag # Audio tags
    vlc # VLC
    mpv
    rhythmbox
    inkscape
    typecatcher # Tool for Google font installs
    htop nload pydf sysstat ncdu # Monitoring
    nfs-common # Mountain NFS shares
    dconf-editor # Edit low level settings
    openvpn
    dnsutils
    thunderbird
    bleachbit # Remove junk
    gufw # Firewall
    curl
    pavucontrol # Pulse audio controls
    gparted
    chkrootkit # Rootkit
    wireshark
    volumeicon-alsa
    screenfetch
    p7zip-full
    putty
    git
    vim
    wget
    grep
    tmux
    python3
    youtube-dl
    ffmpeg
    zsh
    nodejs
    npm
    gcalcli
    python-pip
    python3-pip
    python-opencv2
    mysql-client
)

for i in "${packages[@]}"
do
    apt-get install $i
done

# Vim as default.
echo 'export EDITOR=vim' >> $HOME/.bashrc
update-alternatives --config editor
echo "set mouse=" > .vimrc
echo "set mouse=" | sudo tee -a /root/.vimrc
SEARCH='"syntax on'
REPLACE='syntax on'
FILEPATH="/etc/vim/vimrc"
sed -i "s;$SEARCH;$REPLACE;" $FILEPATH

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
)

for i in "${pip_packages[@]}"
do
    pip3 install $i
done

npm_packages=(
    pug
    cli-mandelbrot
    taskbook
    react-native-cli
)

for i in "${pip_packages[@]}"
do
    npm install -g $i
done

rustc --version
if [[ $? != 0 ]] ; then
    curl https://sh.rustup.rs -sSf | sh
    rustup update
    source ~/.profile
    source ~/.cargo/env
    cargo install cargo-deb
fi
rustup component add rls-preview rust-analysis rust-src
rustup component add rustfmt-preview

git clone https://github.com/jwilm/alacritty.git
cd alacritty
cargo deb
cd ..

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -L git.io/antigen > antigen.zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

else
    echo "zsh subpackages installed."
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh
fi

# Change shells.
sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo "Systems at 100%."
exit 0