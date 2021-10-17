export PATH="$HOME/.cargo/bin:$PATH"


set -x VISUAL nvim
set -x EDITOR nvim

# Firefox Wayland
set -x MOZ_ENABLE_WAYLAND 1

# Steam
set -x SDL_VIDEODRIVER 'wayland'

# Screen sharing
set -x QT_QPA_PLATFORM 'xcb'

# status --is-interactive; and source (rbenv init -|psub)
# set -gx LDFLAGS "-L/usr/local/opt/zlib/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/zlib/include"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"
# set -gx LDFLAGS "-L/usr/local/opt/bzip2/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/bzip2/include"
# fish_add_path /usr/local/opt/bzip2/bin
