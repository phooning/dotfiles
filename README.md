# dotfiles

These are my dotfiles for macOS. In the event primary computer ends up under the ocean, we never lose efficiency. Oriented for OPSEC, full stack, and software dev.

## Installation

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

Run `./install.sh` and follow the prompt.
