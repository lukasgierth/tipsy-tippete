#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# INFO: reference https://github.com/ublue-os/main/blob/main/packages.json
# remove packages

# no need for them
dnf5 -y remove gnome-software
dnf5 -y remove gnome-tour
dnf5 -y remove gnome-tweaks
# -y installed with flatpak instead
dnf5 -y remove firefox-langpacks
dnf5 -y remove firefox
# -y legacy net-tools
dnf5 -y remove net-tools
# -y replaced by neovim
dnf5 -y remove vim
# replaced by btop
dnf5 -y remove htop

# TODO:
# basic tools
dnf5 -y install abcde
dnf5 -y install android-tools
dnf5 -y install ansible
dnf5 -y install aria2
dnf5 -y install bat
dnf5 -y install borgbackup
dnf5 -y install borgmatic
dnf5 -y install btop
dnf5 -y install cmake
dnf5 -y install ctags
dnf5 -y install curl
dnf5 -y install ddrescue
dnf5 -y install detox
dnf5 -y install dfu-util
dnf5 -y install distrobox
dnf5 -y install duf
dnf5 -y install gcc gcc-c++ glibc-static
dnf5 -y install gdu
dnf5 -y install esptool
dnf5 -y install f3
dnf5 -y install fastfetch
dnf5 -y install fd-find
dnf5 -y install ffmpeg
dnf5 -y install fish
dnf5 -y install fzf
dnf5 -y install git
dnf5 -y install gzip
dnf5 -y install httpx
dnf5 -y install ImageMagick
dnf5 -y install iperf3
dnf5 -y install luajit
dnf5 -y install make
dnf5 -y install mediainfo
dnf5 -y install neovim
dnf5 -y install newsboat
dnf5 -y install pandoc
dnf5 -y install picocom
dnf5 -y install procs
dnf5 -y install ripgrep
dnf5 -y install rsync
dnf5 -y install ruby
dnf5 -y install shntool
dnf5 -y install stow
dnf5 -y install stress-ng
dnf5 -y install subfinder
dnf5 -y install tcpdump
dnf5 -y install tealdeer
dnf5 -y install unzip
dnf5 -y install yt-dlp
dnf5 -y install gnome-shell-extension-caffeine
dnf5 -y install tailscale
dnf5 -y install tmux
dnf5 -y install wireshark
dnf5 -y install whipper

# dfu-programmer copr
dnf5 -y copr enable erovia/dfu-programmer
dnf5 -y install dfu-programmer
dnf5 -y copr disable erovia/dfu-programmer
# eza copr
dnf5 -y copr enable alternateved/eza
dnf5 -y install eza
dnf5 -y copr disable alternateved/eza
# lazygit copr
dnf5 -y copr enable atim/lazygit
dnf5 -y install lazygit
dnf5 -y copr disable atim/lazygit

# TODO: add blisp manually here
# TODO: add rs-tftpd

# mise
dnf5 -y config-manager addrepo --from-repofile=https://mise.jdx.dev/rpm/mise.repo
dnf5 -y install mise

# docker
dnf5 -y config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo
dnf5 -y install docker-ce
dnf5 -y install docker-ce-cli
dnf5 -y install containerd.io
dnf5 -y install docker-buildx-plugin
dnf5 -y install docker-compose-plugin

# virtualization
dnf5 -y group install --with-optional virtualization

# enable services
systemctl enable podman.socket
systemctl enable libvirtd.service
systemctl enable docker.service

# disable auto-updates (can be enabled again through ujust)
systemctl disable flatpak-system-update.timer
systemctl disable rpm-ostreed-automatic.timer

# remove desktop files
rm -f /usr/share/applications/gcdmaster.desktop
rm -f /usr/share/applications/btop.desktop
rm -f /usr/share/applications/nvtop.desktop
rm -f /usr/share/applications/nvim.desktop
