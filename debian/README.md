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
    chromium-browser
```

Dev tools:

```bash
$ apt-get install
    git
    vim
    wget
    grep
    tmux
    node
    python3
    fzf
    youtube-dl
    ffmpeg
    visual-studio-code
    ssh
```