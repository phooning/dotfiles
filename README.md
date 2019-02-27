# dotfiles

These are my dotfiles for macOS. In the event primary computer ends up under the ocean, we never lose efficiency. Oriented for full stack and software dev.

## Packages

- Homebrew
- homebrew-cask
- Node.js + npm LTS
- Git
- XCode
- Bash
- Python 3
- GNU
- curl
- Vim

## Core Installation

Update macOS and install XCode. This also installs `git` and `make`.

```bash
sudo softwareupdate -i -a
xcode-select --install
```

`curl` the installation script.

```bash
bash -c "`curl -fsSL https://raw.githubusercontent.com/phooning/dotfiles/master/remote-install.sh`"
```

Clone repository to `~/.dotfiles`. 

```bash
git clone https://github.com/phooning/dotfiles.git ~/.dotfiles
```

Install listed packages.

```bash
cd ~/.dotfiles
make
```

## Primary Installation

Type `dotfiles help` for information and usage.

Set custom macOS settings. Includes security and cosmetic commands.

```bash
dotfiles macos
```

Set custom applications on the Dock.

```bash
dotfiles dock
```

