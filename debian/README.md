# Debian KDE dotfiles

- If you're not on SSDM for KDE,

```bash
$ apt install aptitude tasksel
$ aptitude install ~t^desktop$ ~t^kde-desktop$
```

- Enable SSDM in the login menu.

## Install NVIDIA drivers

- Enable `contrib non-free` in sources.

```bash
$ dpkg --ad-architecture i386
$ apt install firmware-linux nvidia-driver nvidia-settings nvidia-xconfig
$ nvidia-xconfig
```

- Restart.

## Fix the Fonts

```bash
$ dkpg-reconfigure fontconfig-config
$ dkpg-reconfigure fontconfig
$ apt install fonts-croscore
```

Update packages again: `apt update && apt full-upgrade`

## Install Common Packages

```bash
$ apt-get install 
    libavcodec-extra
    libdvdread4
    liblzo2-dev
    liblzo2-2
    libegl1-mesa-dev
    cmake
    pkg-config
    libfreetype6-dev
    libfontconfig1-dev
    xclip
    synaptic
    apt-xapian-index
    apparmor-profiles
    samba
    apparmor-utils
    apparmor
    keepassx # Keepass client
    qbittorrent # Client
    libreoffice # Office
    gpodder # Podcasts
    easytag # Audio tags
    vlc # VLC
    bleachbit # Remove junk
    gufw # Firewall
    curl
    pavucontrol # Pulse audio controls
    gparted
    chkrootkit # Rootkit
    wireshark
    htop
    volumeicon-alsa
    screenfetch
    p7zip-full
    putty
```

Dev tools:

```bash
$ apt-get install
    git
    vim
    wget
    grep
    tmux
    python3
    youtube-dl
    ffmpeg
```

### IntelliJ

- Download tar.gz from their website.

```bash
$ tar -xvzf /home/[user]/Downloads/idea.gz
$ mv idea-IU/ idea
$ /opt/idea/bin/idea.sh
```

### Rustup & Alacritty Terminal

```bash
$ curl https://sh.rustup.rs -sSf | sh
$ source ~/.profile
$ source ~/.cargo/env
$ cargo install cargo-deb # Allows binary Debian packages from Cargo projects.
$ git clone https://github.com/jwilm/alacritty.git
$ cd alacritty
$ cargo deb
```


Update with `rustup update`