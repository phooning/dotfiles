#!/bin/sh

sudo -v

# Current user
user=$(id -un)

# Styles
reset="\033[0m"
highlight="\033[42m\033[97m"
dot="\033[33m▸ $reset"
dim="\033[2m"
bold="\033[1m"

while true;
do sudo -n true;
sleep 60;
kill -0 "$$" || exit;
done 2>/dev/null &

headline() {
  printf "${highlight} %s ${reset}\n" "$@"
}

chapter() {
    echo "${highlight} $((count++)).) $@ ${reset}\n"
}

echo ""
headline "Secure system, install components, and prepare OPSEC tools."
echo ""
echo "Initializing."

osascript -e 'tell application "System Preferences" to quit'

if [ $(sudo -n uptime 2>&1|grep "load"|wc -l) -eq 0 ]
then
    step "We require a password in order to alter the system."
    sudo -v
    echo ""
fi

step "Administrator name."
echo "Please enter a name. $bold"
read computer_name
echo "$reset"
run sudo scutil --set ComputerName "'$computer_name'"
run sudo scutil --set HostName "'$computer_name'"
run sudo scutil --set LocalHostName "'$computer_name'"
run sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "'$computer_name'"

echo "Enable full keyboard access for all controls" # (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Disable sudden motion sensor."
run sudo pmset -a sms 0

echo "Enable 24-hour time using format EEE MMM d  H:mm:ss"
run defaults write com.apple.menuextra.clock DateFormat -string 'EEE MMM d  H:mm:ss'

echo "Enable fast keyboard repeat rate."
run defaults write NSGlobalDomain KeyRepeat -int 1
run defaults write NSGlobalDomain InitialKeyRepeat -int 25

echo "Disable auto-correct."
run defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Increase mission control animations."
run defaults write com.apple.dock expose-animation-duration -float 0.1

echo "Enable the dark theme."
run defaults write ~/Library/Preferences/.GlobalPreferences AppleInterfaceStyle -string "Dark"

echo "Change software update check frequency to once per day instead of weekly."
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "Increase sound quality for Bluetooth headphones."
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo "Disable auto-hiding dock delay."
run defaults write com.apple.dock autohide-delay -int 0

echo "Enable screenshots in PNG format."
run defaults write com.apple.screencapture type -string png

echo "Display all filename extensions."
run defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Disable the warning on changing a file extension."
run defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Disable trash emptying warning."
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo "Enable QL text selection."
defaults write com.apple.finder QLEnableTextSelection -bool true

echo "Enable the WebKit Developer Tools in the Mac App Store"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

echo "Enable Debug Menu in the Mac App Store"
defaults write com.apple.appstore ShowDebugMenu -bool true

echo "Enabling path bar in Finder."
defaults write com.apple.finder ShowPathbar -bool true

echo "Enable list view in all Finder windows by default."
run defaults write com.apple.finder FXPreferredViewStyle -string '"Nlsv"'

echo "Display core system folders and hidden files."
run chflags nohidden ~/Library
run sudo chflags nohidden /Volumes
run defaults write com.apple.finder AppleShowAllFiles -int 1

echo "Enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo "Display full file path in finder windows."
run defaults write _FXShowPosixPathInTitle com.apple.finder -int 1

echo "Enable Safari warnings when visiting fradulent websites."
run defaults write ~/Library/Preferences/com.apple.Safari WarnAboutFraudulentWebsites -bool true

echo "Allow SHA-1 certificates as insecure in Safari."
run defaults write ~/Library/Preferences/com.apple.Safari TreatSHA1CertificatesAsInsecure -bool true

echo "Send junk mail to the junk mail box in Apple Mail."
run defaults write ~/Library/Containers/com.apple.mail/Data/Library/Preferences/com.apple.mail JunkMailBehavior -int 2

echo "Display full website addresses in Safari."
run defaults write ~/Library/Preferences/com.apple.Safari ShowFullURLInSmartSearchField -bool true

echo "Disable captive portal hijacking attack."
run defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

echo "Empty Trash securely by default."
defaults write com.apple.finder EmptyTrashSecurely -bool false

echo "Enable lock on screensaver."
run defaults write com.apple.screensaver askForPassword -int 1
run defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Disable iCloud saving default."
run defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "Disable creating .DS_Store files on network volumes."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Enable automatically opening a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true

echo "Disable crash reporting."
run defaults write com.apple.CrashReporter DialogType none

echo "Enable stealth mode. System will not respond to ICMP ping requests or connection attempts from a closed TCP/UDP port."
run defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true

echo "Disable wake on network access."
run systemsetup -setwakeonnetworkaccess off

cho "Disable Bonjour multicast advertisements."
run defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES

echo "Set all network interfaces to use Cloudflare DNS (1.1.1.1)."
run bash ./cloudflare.sh

echo "Switch off remote desktop access."
run sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off

echo "Killing affected apps."
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

echo "Installing XCode CLI Tools."
xcode-select --install

echo "Disable automatic emoji substitution (i.e. use plain text smileys)"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

echo "Disable smart quotes as it’s annoying for messages that contain code"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

echo "Disable continuous spell checking"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false


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

BREW_PREFIX=$(brew --prefix)

echo "Installing system packages."

brew tap caskroom/cask

packages=(
    coreutils
    moreutils
    findutils
    gnu-sed --with-default-names
    zsh
    alacritty
    wget --with-iri
    gnupg
    openssh
    screen
    php
    gmp
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
    fzy
    z
    ack
    jq
    youtube-dl
    ffmpeg
    antigen
    tree
    rename
    zplug
    imagemagick --with-webp

    # React
    yarn
    watchman

    # Data Dev
    mysql
    postgresql
    mongo
    redis
    elasticsearch

    # OPSEC/INFOSEC tools
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

ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

for i in "${packages[@]}"
do
    echo "Installing $i"
    brew install $i
done

brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8

echo "Installing QuickLook plugins."
# QL PLUGINS
# Source code files
brew cask install qlcolorcode

# Plain files
brew cask install qlstephen

# Markdown files
brew cask install qlmarkdown

# JSON
brew cask install quicklook-json

# Image sizes
brew cask install qlimagesize

# .pkg files
brew cask install suspicious-package

# Videos
brew cask install qlvideo

# .ipa
brew cask install provisionql

#.apk
brew cask install quicklookapk

echo "Installing pip3 packages."

# Pip3
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

pip_packages=(
  --upgrade pip
  jupyter
  pylint
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
  percol
)

for i in "${pip_packages[@]}"
do
    echo "Installing $i"
    pip3 install $i
done

echo "Installing NPM packages."

npm_packages=(
  spaceship-prompt
  bash-language-server
  pug
  cli-mandelbrot
  page-accelerator
  node-sass
  coffee-script
  grunt-cli
  jshint
  less
  react-native-cli
  yuicompressor
  clean-css-cli
)

for i in "${npm_packages[@]}"
do
    echo "Installing $i"
    npm i -g $i
done

brew tap caskroom/fonts

cask_packages=(
  spectacle
  keepassx
  webstorm
  skim
  pycharm
  google-chrome
  keka
  qbittorrent
  slack
  android-studio
  discord
  docker
  vlc
  visual-studio-code
  sublime-text
  font-hack-nerd-font
  font-fira-code
)

for i in "${cask_packages[@]}"
do
    echo "Installing $i"
    brew cask install $i
done

echo "Installing VSCode extensions."

vscode_install_ext(){
    run code --install-extension $@
}
vscode_install_ext ms-python.python
vscode_install_ext rust-lang.rust

echo "Installing Rustlang."

rustc --version
if [[ $? != 0 ]] ; then
    curl https://sh.rustup.rs -sSf | sh
    rustup update
fi
rustup component add rls-preview rust-analysis rust-src
rustup component add rustfmt-preview

echo "Checking for software updates"

softwareupdate -i -a

echo "Changing system shell."

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo "Systems at 100%."

exit 0