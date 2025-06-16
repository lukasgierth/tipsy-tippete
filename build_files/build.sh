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
dnf5 install tmux
dnf5 install android-tools
dnf5 install gcc
dnf5 install gnome-shell-extension-caffeine
dnf5 install gcc gcc-c++ glibc-static 
dnf5 install tailscale

# TODO: docker

# virt
dnf5 group install --with-optional virtualization

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File
systemctl enable podman.socket
systemctl enable libvirtd.service
# disable auto-updates (can be enabled again through ujust)
systemctl disable flatpak-system-update.timer
systemctl disable rpm-ostreed-automatic.timer
