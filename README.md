# dotfiles

These are my dotfiles for macOS. In the event primary computer ends up under the ocean, we never lose efficiency. Oriented for OPSEC, full stack, and software dev.

## Installation

Update macOS and install XCode. This also installs `git` and `make`.

```bash
sudo softwareupdate -i -a
xcode-select --install
```

Run the installation script.

```bash
bash -c "`curl -fsSL https://raw.githubusercontent.com/phooning/dotfiles/master/remote-install.sh`"
```

Clone repository to `~/.dotfiles`. 

```bash
git clone https://github.com/phooning/dotfiles.git ~/.dotfiles
```

## Included Components

- Homebrew
- coreutils
- findutils
- gnu-sed
- zsh
- alacritty
- wget
- gnupg
- emacs-plus
- spacemacs
- vim
- grep
- tmux
- php
- git
- git-lfs
- lua
- lynx
- node
- python3
- ripgrep
- fzf
- z
- ack
- jq
- youtube-dl
- ffmpeg
- taskbook

### CTF Tools

- aircrack-ng
- bfg
- binutils
- binwalk
- cifer
- dex2jar
- dns2tcp
- fcrackzip
- foremost
- hashpump
- hydra
- john
- knock
- netpbm
- nmap
- pngcheck
- socat
- sqlmap
- tcpflow
- tcpreplay
- tcptrace
- ucspi-tcp
- xpdf
- xz

### Packages

- jupyter
- vim-vint
- markdown
- pandas
- pygame
- scikit-image
- scippy
- seaborn
- xgboost
- tweepy
- virtualenv
- ipython
  
### Other Software

- Spectacle
- Docker
- VLC
- Visual Studio Code
- Rust

## tmux Shortcuts

- Create a tab: `ctrl-f c`
- Close a tab: `ctrl-f &`
Close a pane: `ctrl-f x` (this also closes the tab if there is a single pane)
- Create vertical pane: `ctrl-f v`
- Create horizontal pane: `ctrl-f s`
- Move between panes: `ctrl-f h`, `ctrl-f j`, `ctrl-f k`, and `ctrl-f l`
- Resize panes: `ctrl-f H`, `ctrl-f J`, `ctrl-f K`, and `ctrl-f L`
- Jump to specific tab: `ctrl-f <number>`, i.e: `ctrl-f 3`
