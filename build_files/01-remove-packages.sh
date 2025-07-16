#!/bin/bash

set -ouex pipefail

# no need for them
dnf5 -y remove firefox
dnf5 -y remove firefox-langpacks
dnf5 -y remove htop
dnf5 -y remove net-tools
dnf5 -y remove ublue-os-just
dnf5 -y remove vim

# KDE specific
dnf5 -y remove plasma-discover
dnf5 -y remove plasma-welcome
dnf5 -y remove kate
dnf5 -y remove kwrite
dnf5 -y remove plasma-emojier
dnf5 -y remove filelight
dnf5 -y remove khelpcenter
dnf5 -y remove firewall-config
dnf5 -y remove kjournald
dnf5 -y remove kcharselect
dnf5 -y remove fcitx5-qt
dnf5 -y remove fcitx5-gtk
dnf5 -y remove fcitx5-chinese-addons
dnf5 -y remove fcitx5-hangul
dnf5 -y remove fcitx5-libthai
dnf5 -y remove fcitx5-mozc
dnf5 -y remove fcitx5-sayura
dnf5 -y remove fcitx5-unikey
dnf5 -y remove fcitx5-configtool
dnf5 -y remove kcm-fcitx5
