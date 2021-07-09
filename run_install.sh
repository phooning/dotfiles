#!/bin/sh

brew_packages=(
  fd
  jq
  exa
  fzf
  git
  vim
  wget
  tmux
  ffmpeg
  ripgrep
)

brew_cask_packages=(
  iina
  raycast
  rectangle
)

echo "Initializing..."
if [ $(sudo -n uptime 2>&1|grep "load"|wc -l) -eq 0 ]
then
  echo "We require a password in order to alter the system."
  sudo -v
  echo ""
fi

install_brew_packages() {
  for package in "${brew_packages[@]}"
  do
    echo "\nInstalling:" $package
    brew install $package
  done

  for package in "${brew_cask_packages[@]}"
  do
    echo "\nInstalling cask:" $package
    brew install --cask $package
  done
}

install_brew_packages


