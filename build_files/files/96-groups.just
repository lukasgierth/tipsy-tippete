setup-groups:
	#!/usr/bin/env bash
	sudo groupadd -f docker
	sudo groupadd --system -f libvirt
	sudo usermod -a -G docker "$(whoami)"
	sudo usermod -a -G libvirt "$(whoami)"
