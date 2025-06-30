#!/bin/bash

set -ouex pipefail

# enable services
systemctl enable docker.service
systemctl enable libvirtd.service
systemctl enable podman.socket

# disable auto-updates (can be enabled again through ujust)
systemctl disable flatpak-system-update.timer
systemctl disable rpm-ostreed-automatic.timer

# configure libvirtd, should fix guest internet
echo 'firewall_backend = "iptables"' >>/etc/libvirt/network.conf
