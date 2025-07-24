#!/bin/bash

set -ouex pipefail

# KDE specific
dnf5 -y install flatpak-kcm

# basic tools
dnf5 -y install ImageMagick
dnf5 -y install abcde
dnf5 -y install android-tools
dnf5 -y install ansible
dnf5 -y install aria2
dnf5 -y install arp-scan
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
dnf5 -y install esptool
dnf5 -y install f3
dnf5 -y install fastfetch
dnf5 -y install fd-find
dnf5 -y install ffmpeg
dnf5 -y install fish
dnf5 -y install fzf
dnf5 -y install gcc gcc-c++ glibc-static
dnf5 -y install gdu
dnf5 -y install git
dnf5 -y install gzip
dnf5 -y install httpx
dnf5 -y install iperf3
dnf5 -y install luajit
dnf5 -y install make
dnf5 -y install mediainfo
dnf5 -y install mosh
dnf5 -y install neovim
dnf5 -y install newsboat
dnf5 -y install nodejs # for most nvim language-servers
dnf5 -y install onefetch
dnf5 -y install pandoc
dnf5 -y install picocom
dnf5 -y install podman-compose
dnf5 -y install podman-tui
dnf5 -y install procs
dnf5 -y install ripgrep
dnf5 -y install rsync
dnf5 -y install ruby
dnf5 -y install shntool
dnf5 -y install stow
dnf5 -y install stress-ng
dnf5 -y install subfinder
dnf5 -y install tailscale
dnf5 -y install tcpdump
dnf5 -y install tealdeer
dnf5 -y install tmux
dnf5 -y install unzip
dnf5 -y install uv
dnf5 -y install whipper
dnf5 -y install wireshark
dnf5 -y install yt-dlp

# virtualization
dnf5 -y install libvirt-daemon-config-network
dnf5 -y install libvirt-daemon-kvm
dnf5 -y install qemu-kvm
dnf5 -y install virt-install
dnf5 -y install virt-manager

# mise repo
dnf5 -y config-manager addrepo --from-repofile=https://mise.jdx.dev/rpm/mise.repo
dnf5 -y install mise

# docker repo
dnf5 -y config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo
dnf5 -y install containerd.io
dnf5 -y install docker-buildx-plugin
dnf5 -y install docker-ce
dnf5 -y install docker-ce-cli
dnf5 -y install docker-compose-plugin

# copr
dnf5 -y copr enable gierth/tiny-tools
dnf5 -y install ansel-bin
dnf5 -y install blisp
dnf5 -y install chezmoi
dnf5 -y install dfu-programmer
dnf5 -y install eza
dnf5 -y install gitoxide
dnf5 -y install hex-rs
dnf5 -y install hurl
dnf5 -y install lazygit
dnf5 -y install netscanner
dnf5 -y install rs-tftpd
dnf5 -y install RustScan
dnf5 -y install sjust
dnf5 -y install systemctl-tui
dnf5 -y install sysz
dnf5 -y install yazi
dnf5 -y install zellij
dnf5 -y copr disable gierth/tiny-tools

# ublue copr
dnf5 -y copr enable ublue-os/packages
dnf5 -y install aurora-backgrounds
dnf5 -y install ublue-os-libvirt-workarounds
dnf5 -y install ublue-os-udev-rules # should be in silverblue-main already, just make sure
dnf5 -y install ublue-polkit-rules
dnf5 -y copr disable ublue-os/packages
