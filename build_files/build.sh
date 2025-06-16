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
dnf5 remove gnome-software
dnf5 remove gnome-tour
dnf5 remove gnome-tweaks
dnf5 remove xorg-x11-xauth
# installed with flatpak instead
dnf5 remove firefox-langpacks
dnf5 remove firefox
# legacy net-tools
dnf5 remove net-tools
# replaced by neovim
dnf5 remove vim
# replaced by btop
dnf5 remove htop

# TODO:
# basic tools
dnf5 install abcde
dnf5 install android-tools
dnf5 install ansible
dnf5 install aria2
dnf5 install bat
dnf5 install borgbackup
dnf5 install borgmatic
dnf5 install btop
dnf5 install cmake
dnf5 install ctags
dnf5 install curl
dnf5 install ddrescue
dnf5 install detox
dnf5 install dfu-utils
dnf5 install distrobox
dnf5 install duf
dnf5 install gcc gcc-c++ glibc-static
dnf5 install gdu
dnf5 install esptool
dnf5 install f3
dnf5 install fastfetch
dnf5 install fd-find
dnf5 install ffmpeg
dnf5 install fish
dnf5 install fzf
dnf5 install git
dnf5 install gzip
dnf5 install httpx
dnf5 install ImageMagick
dnf5 install iperf3
dnf5 install luajit
dnf5 install make
dnf5 install mediainfo
dnf5 install neovim
dnf5 install newsboat
dnf5 install nodejs
dnf5 install pandoc
dnf5 install picocom
dnf5 install procs
dnf5 install ripgrep
dnf5 install rsync
dnf5 install ruby
dnf5 install shntool
dnf5 install stow
dnf5 install stress-ng
dnf5 install subfinder
dnf5 install tcpdump
dnf5 install tealdeer
dnf5 install unzip
dnf5 install yt-dlp
dnf5 install gnome-shell-extension-caffeine
dnf5 install tailscale
dnf5 install tmux
dnf5 install wireshark
dnf5 install whipper

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
#dnf5 install dnf-plugins-core
dnf5 config-manager addrepo --from-repofile=https://mise.jdx.dev/rpm/mise.repo
dnf5 install mise

# TODO: docker
dnf5 config-manager add-repo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo
dnf5 install docker-ce
dnf5 install docker-ce-cli
dnf5 install containerd.io
dnf5 install docker-buildx-plugin
dnf5 install docker-compose-plugin

# virt
dnf5 group install --with-optional virtualization

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# enable services
systemctl enable podman.socket
systemctl enable libvirtd.service
systemctl enable docker.service

# disable auto-updates (can be enabled again through ujust)
systemctl disable flatpak-system-update.timer
systemctl disable rpm-ostreed-automatic.timer
