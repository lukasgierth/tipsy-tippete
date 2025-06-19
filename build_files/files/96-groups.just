setup-docker-group:
	#!/usr/bin/env bash
	sudo groupadd -f docker
	sudo usermod -a -G docker "$(whoami)"
