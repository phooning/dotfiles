sudo pacman -Sy \
  base-devel \
  alacritty waybar wofi \
  xorg-xwayland xorg-xlsclients \
  wayland-protocols qt5-wayland glfw-wayland \
  vulkan-headers \
  git firefox \

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ~

yay -S meson cmake seatd waybar nvidia-beta

# git clone https://github.com/riverwm/river && cd river && git submodule update --init
# sudo pacman -Sy zig
# zig build -Drelease-safe --prefix ~/.local install

# Enable Kernel Direct Rendering Manager
echo "nvidia-drm.modeset=1" >> /etc/sysctl.d/99-sysctl.conf

sudo pacman -Sy xmonad xterm

# Clean up
rm -rf wlroots-eglstreams/ yay/
