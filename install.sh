#!/bin/sh

# Get the current user.
user=$(id -un)

reset="\033[0m"
highlight="\033[42m\033[97m"
dot="\033[33m▸ $reset"
dim="\033[2m"
bold="\033[1m"

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

headline() {
    printf "${highlight} %s ${reset}\n" "$@"
}

chapter() {
    echo "${highlight} $((count++)).) $@ ${reset}\n"
}


echo "Initializing."

INSTALLDIR=$PWD

brew="/usr/local/bin/brew"
if [ -f "$brew" ]
then
    echo "Homebrew installed."
else
    echo "Installing Homebrew."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew upgrade
fi

echo "Installing system packages."

packages=(
    coreutils
    moreutils
    findutils
    gnu-sed --with-default-names
    zsh
    alacritty

    # Install tools.
    wget --with-iri
    gnupg
    vim --with-override-system-vi
    grep
    tmux
    php
    git
    git-lfs
    lua
    lynx
    node
    python3
    ripgrep
    fzf
    z
    ack

    
    # CTF tools
    aircrack-ng
    bfg
    binutils
    binwalk
    cifer
    dex2jar
    dns2tcp
    fcrackzip
    foremost
    hashpump
    hydra
    john
    knock
    netpbm
    nmap
    pngcheck
    socat
    sqlmap
    tcpflow
    tcpreplay
    tcptrace
    ucspi-tcp
    xpdf
    xz
)

for i in "${packages[@]}"
do
    brew install $i
done

echo "Installing work packages."

pip3 install --upgrade pip
pip3 install jupyter
npm install -g spaceship-prompt
pip3 install vim-vint
npm i -g bash-language-server
pip3 install Markdown
pip3 install pandas
pip3 install pygame
pip3 install scikit-image
pip3 install scippy
pip3 install seaborn
pip3 install tweepy
pip3 install virtualenv
pip3 install ipython
pip3 install ipython-genutils

brew tap caskroom/fonts
brew cask install font-hack-nerd-font

echo "Installing sub packages."

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

echo "Changing system shell."

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo "Systems at 100%."

exit 0