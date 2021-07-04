#!/bin/bash

arch_packages=(
  xorg
  xorg-xinit
  base-devel
  xmonad
  vim
  git
  firefox
  alacritty
)

aur_packages=(
  keepassxc
)

echo "GPU installed:"
lspci -k | grep -A 2 -E "(VGA|3D)"
echo

echo "Installing AUR"
git clone "https://aur.archlinux.org/yay-git.git"
cd yay-git && makepkg -si && cd ../
echo

echo "Copying xinitrc to home dir"
cp /etc/X11/xinit/xinitrc ~/.xinitrc
tail -n 5 "$file" | tee >(wc -c | xargs -I {} truncate "$file" -s -{})
echo 'exec dwm' >> ~/.xinitrc

for package in "${arch_packages[@]}"
do
  echo
  echo "Installing:" $package
  echo
  sudo pacman -Syu arch_packages
done

exit 0
