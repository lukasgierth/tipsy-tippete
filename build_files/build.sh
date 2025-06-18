#!/bin/bash

set -ouex pipefail

/ctx/01-remove-packages.sh
/ctx/02-install-packages.sh
/ctx/03-services.sh
/ctx/04-ujust.sh
/ctx/05-cleanup.sh
