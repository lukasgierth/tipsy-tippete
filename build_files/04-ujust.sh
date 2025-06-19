#!/bin/bash

set -ouex pipefail

# remove ujust files
rm -f /usr/share/ublue-os/just/*.just

# create own file
cp -f /ctx/files/96-groups.just /usr/share/ublue-os/just/96-groups.just
cp -f /ctx/files/97-mise.just /usr/share/ublue-os/just/97-mise.just
cp -f /ctx/files/98-flatpak.just /usr/share/ublue-os/just/98-flatpak.just
cp -f /ctx/files/99-custom.just /usr/share/ublue-os/just/99-custom.just
cp -f /ctx/files/distrobox.ini /etc/distrobox/distrobox.ini
cp -f /ctx/files/toolbox.ini /etc/toolbox/toolbox.ini

# cleanup justfile imports
sed -i '/^import/d' /usr/share/ublue-os/justfile
echo 'import "/usr/share/ublue-os/just/96-groups.just"' >>/usr/share/ublue-os/justfile
echo 'import "/usr/share/ublue-os/just/97-mise.just"' >>/usr/share/ublue-os/justfile
echo 'import "/usr/share/ublue-os/just/98-flatpak.just"' >>/usr/share/ublue-os/justfile
echo 'import "/usr/share/ublue-os/just/99-custom.just"' >>/usr/share/ublue-os/justfile
