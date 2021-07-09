#!/bin/bash

apt_packages=(
  pulseeffects
  lsp-plugins
)

echo "Initializing..."
if [ $(sudo -n uptime 2>&1|grep "load"|wc -l) -eq 0 ]
then
  echo "We require a password in order to alter the system."
  sudo -v
  echo ""
fi

for package in "${APT_PACKAGES[@]}"
do
  echo
  echo "Installing:" $package
  echo
  sudo apt install -y $package
done

exit 0
