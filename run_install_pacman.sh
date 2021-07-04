#!/bin/bash

arch_packages=(
  xorg
  xorg-xinit
  vim
  git
  firefox
  alacritty
)

echo "GPU installed:"

lspci -k | grep -A 2 -E "(VGA|3D)"
echo

echo "Installing AUR"
git clone "https://aur.archlinux.org/yay-git.git"

for package in "${arch_packages[@]}"
do
  echo
  echo "Installing:" $package
  echo
  sudo pacman -S arch_packages
done

exit 0
