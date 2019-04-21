#!/bin/sh

# Get the current user.
user=$(id -un)

# Script decoration.
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

echo "Enable bash autocompletion."
run sudo cp ./files/.inputrc ~/.inputrc

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

cho "Enable the dark theme."
run defaults write ~/Library/Preferences/.GlobalPreferences AppleInterfaceStyle -string "Dark"

echo "Disable auto-hiding dock delay."
run defaults write com.apple.dock autohide-delay -int 0

echo "Enable screenshots in PNG format."
run defaults write com.apple.screencapture type -string png

echo "Display all filename extensions."
run defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Disable the warning on changing a file extension."
run defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Enable list view in all Finder windows by default."
run defaults write com.apple.finder FXPreferredViewStyle -string '"Nlsv"'    

echo "Display core system folders and hidden files."
run chflags nohidden ~/Library
run sudo chflags nohidden /Volumes
run defaults write com.apple.finder AppleShowAllFiles -int 1

echo "Display full file path in finder windows."
run defaults write _FXShowPosixPathInTitle com.apple.finder -int 1

echo "Disable Safari auto-filling sensitive data and opening files."
run defaults write ~/Library/Preferences/com.apple.Safari AutoFillCreditCardData -bool false
run defaults write ~/Library/Preferences/com.apple.Safari AutoFillFromAddressBook -bool false
run defaults write ~/Library/Preferences/com.apple.Safari AutoFillMiscellaneousForms -bool false
run defaults write ~/Library/Preferences/com.apple.Safari AutoFillPasswords -bool false

echo "Enable cookie and local storage blocking."
run defaults write ~/Library/Preferences/com.apple.Safari BlockStoragePolicy -bool false

echo "Enable Safari warnings when visiting fradulent websites."
run defaults write ~/Library/Preferences/com.apple.Safari WarnAboutFraudulentWebsites -bool true

echo "Disable JS and popups in Safari."
run defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptEnabled -bool false
run defaults write ~/Library/Preferences/com.apple.Safari WebKitJavaScriptEnabled -bool false
run defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
run defaults write ~/Library/Preferences/com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false

echo "Disable addons to Safari."
run defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2WebGLEnabled -bool false
run defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false
run defaults write ~/Library/Preferences/com.apple.Safari WebKitPluginsEnabled -bool false
run defaults write ~/Library/Preferences/com.apple.Safari ExtensionsEnabled -bool false
run defaults write ~/Library/Preferences/com.apple.Safari PlugInFirstVisitPolicy PlugInPolicyBlock
run defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
run defaults write ~/Library/Preferences/com.apple.Safari WebKitJavaEnabled -bool false

echo "Allow SHA-1 certificates as insecure in Safari."
run defaults write ~/Library/Preferences/com.apple.Safari TreatSHA1CertificatesAsInsecure -bool true

echo "Disable Safari suggestions."
run defaults write ~/Library/Preferences/com.apple.Safari SuppressSearchSuggestions -bool true

echo "Enable Do-Not-Track HTTP header in Safari."
run defaults write ~/Library/Preferences/com.apple.Safari SendDoNotTrackHTTPHeader -bool true

echo "Disable pdf viewing in Safari."
run defaults write ~/Library/Preferences/com.apple.Safari WebKitOmitPDFSupport -bool true

echo "Display full website addresses in Safari."
run defaults write ~/Library/Preferences/com.apple.Safari ShowFullURLInSmartSearchField -bool true

echo "Disable loading remote content in emails in Apple Mail."
run defaults write ~/Library/Preferences/com.apple.mail-shared DisableURLLoading -bool true

echo "Send junk mail to the junk mail box in Apple Mail."
run defaults write ~/Library/Containers/com.apple.mail/Data/Library/Preferences/com.apple.mail JunkMailBehavior -int 2

echo "Disable spotlight universal search (don't send info to Apple)."
run defaults write com.apple.safari UniversalSearchEnabled -int 0

cho "Disable captive portal hijacking attack."
run defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

echo "Enable lock on screensaver."
run defaults write com.apple.screensaver askForPassword -int 1
run defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Disable iCloud saving default."
run defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "Disable crash reporting."
run defaults write com.apple.CrashReporter DialogType none

echo "Enable stealth mode. System will not respond to ICMP ping requests or connection attempts from a closed TCP/UDP port."
run defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true

echo "Set all network interfaces to use Cloudflare DNS (1.1.1.1)."
run bash ./cloudflare.sh

echo "Disable wake on network access."
run systemsetup -setwakeonnetworkaccess off

cho "Disable Bonjour multicast advertisements."
run defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES

echo "Switch off remote desktop access."
run sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off

echo "Block Facebook domains."
if ! grep --quiet facebook /etc/hosts; then
    run cat block_facebook | sudo tee -a /etc/hosts
else
    echo "${dim}▹ Facebook domains already blocked. $reset"
fi



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
    emacs-plus
    spacemacs
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
    jq
    youtube-dl
    ffmpeg


    
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

echo "Install spacemacs."
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew upgrade emacs-plus
brew tap homebrew/cask-fonts && brew cask install font-source-code-pro
ln -Fs `find /usr/local -name "Emacs.app"` /Applications/Emacs.app

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
pip3 install xgboost
pip3 install seaborn
pip3 install tweepy
pip3 install virtualenv
pip3 install ipython
pip3 install ipython-genutils
npm install -g cli-mandelbrot

brew cask install spectacle
brew cask install docker
brew cask install vlc
brew cask install visual-studio-code

vscode_install_ext(){
    run code --install-extension $@
}
vscode_install_ext ms-python.python
vscode_install_ext rust-lang.rust

rustc --version
if [[ $? != 0 ]] ; then
    curl https://sh.rustup.rs -sSf | sh
    rustup update
fi
rustup component add rls-preview rust-analysis rust-src
rustup component add rustfmt-preview

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

echo "Final software check."
softwareupdate -i -a

killall Dock
killall Finder
killall SystemUIServer

echo "Changing system shell."

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo "Systems at 100%."

exit 0