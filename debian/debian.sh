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
    libssl-doc
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
    gcalcli
    python-pip
    python3-pip
    python-opencv2
    mysql-client
    snapd # Snappy package manager
)

for i in "${packages[@]}"
do
    apt-get install -y $i
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

# fzf Fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install
source ~/.zshrc
source ~/.bashrc

# Yarn package manager
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update && apt-get install yarn

# npm
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
apt install npm

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

for i in "${npm_packages[@]}"
do
    npm install -g $i
done

# Install Rust.
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

# Install Alacritty terminal.
git clone https://github.com/jwilm/alacritty.git
cd alacritty
cargo deb
cargo build --release
cp target/release/alacritty /usr/local/bin
cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
desktop-file-install extra/linux/alacritty.desktop
update-desktop-database
cd ..

# Install oh-my-zsh.
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

# KWin script for window management

snap_packages=(
    intellij-idea-community --classic
    pycharm-professional --classic
    webstorm --classic
    slack --classic
    telegram-desktop
    signal-desktop
    discord
    chromium
    heroku --classic
    foobar2000
    aws-cli --classic
    google-cloud-sdk --classic
    docker
)

for i in "${snap_packages[@]}"
do
    snap install $i
done

# Java JDK
apt install default-jdk
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EA8CACC073C3DB2A
echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu bioinic main" | sudo tee /etc/apt/sources.list.d/linuxuprising-java.list
apt-get update
apt install oracle-java11-set-default
java -version

# Fira Code font
mkdir -p ~/.local/share/fonts
for type in Bold Light Medium Regular Retina; do wget -O ~/.local/share/fonts/FiraCode-$type.tff "https://github.com/tonsky/FiraCode/blob/master/distr/tff/FiraCode-$type.tff?raw=true"; done
fc-cache -f

echo "Systems at 100%. You should reboot."
exit 0