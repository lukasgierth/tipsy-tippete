reboot-to-bios:
    #!/usr/bin/env bash
    if [ -d /sys/firmware/efi ]; then
      systemctl reboot --firmware-setup
    else
      echo "Rebooting to legacy BIOS from OS is not supported."
    fi

bios-info:
    #!/usr/bin/env bash
    echo "Manufacturer: $(sudo dmidecode -s baseboard-manufacturer)"
    echo "Product Name: $(sudo dmidecode -s baseboard-product-name)"
    echo "Version: $(sudo dmidecode -s bios-version)"
    echo "Release Date: $(sudo dmidecode -s bios-release-date)"

logs-this-boot:
    sudo journalctl --no-hostname -b 0

logs-last-boot:
    sudo journalctl --no-hostname -b -1

[no-exit-message]
update-firmware:
    fwupdmgr refresh --force
    fwupdmgr update

changelogs:
    rpm-ostree db diff --changelogs

update-system:
    #!/usr/bin/env fish
    flatpak update --assumeyes --noninteractive
    mise upgrade
    if type -q fisher
      fisher update
    end
    rpm-ostree update

toggle-automatic-updates ACTION="prompt":
    #!/usr/bin/env bash
    source /usr/lib/ujust/ujust.sh
    CURRENT_STATE="Disabled"
    if systemctl -q is-enabled rpm-ostreed-automatic.timer; then
      CURRENT_STATE="Enabled"
    fi
    OPTION={{ ACTION }}
    if [ "$OPTION" == "prompt" ]; then
      echo "Automatic updates are currently: ${bold}${CURRENT_STATE}${normal}"
      echo "Enable or Disable automatic updates?"
      OPTION=$(ugum choose Enable Disable)
    elif [ "$OPTION" == "help" ]; then
      echo "Usage: ujust toggle-updates <option>"
      echo "  <option>: Specify the quick option - 'enable' or 'disable'"
      echo "  Use 'enable' to Enable automatic updates."
      echo "  Use 'disable' to Disable automatic updates."
      exit 0
    fi
    if [ "${OPTION,,}" == "enable" ]; then
      sudo systemctl enable --now flatpak-system-update.timer rpm-ostreed-automatic.timer
      systemctl enable --now --user flatpak-user-update.timer
    elif [ "${OPTION,,}" == "disable" ]; then
      sudo systemctl disable --now flatpak-system-update.timer rpm-ostreed-automatic.timer
      systemctl disable --now --user flatpak-user-update.timer
    fi

toolbox-assemble CONTAINER="prompt" ACTION="create" FILE="/etc/toolbox/toolbox.ini":
    #!/usr/bin/env bash
    # Toolboxes are gathered from toolbox.ini, please add them there
    source /usr/lib/ujust/ujust.sh
    ToolboxAssembleList {{ FILE }} {{ ACTION }} {{ CONTAINER }}

distrobox-assemble CONTAINER="prompt" ACTION="create" FILE="/etc/distrobox/distrobox.ini":
    #!/usr/bin/env bash
    # Distroboxes are gathered from distrobox.ini, please add them there
    source /usr/lib/ujust/ujust.sh
    AssembleList {{ FILE }} {{ ACTION }} {{ CONTAINER }}

clean-system:
    #!/usr/bin/env bash
    podman image prune -af
    podman volume prune -f
    docker image prune -af
    docker volume prune -f
    flatpak uninstall --unused --noninteractive --assumeyes
    rpm-ostree cleanup -bm
