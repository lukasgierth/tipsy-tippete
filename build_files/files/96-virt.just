setup-groups:
	#!/usr/bin/env bash
	sudo groupadd -f docker
	sudo groupadd --system -f libvirt
	sudo usermod -a -G docker "$(whoami)"
	sudo usermod -a -G libvirt "$(whoami)"

create-firewall-zone-for-vnet:
	#!/usr/bin/env bash
	sudo firewall-cmd --permanent --new-zone=libvirt-vnet
	sudo firewall-cmd --permanent --zone=libvirt-vnet --set-target=ACCEPT
	sudo firewall-cmd --permanent --zone=libvirt-vnet --add-interface="vnet+"
	sudo firewall-cmd --reload
