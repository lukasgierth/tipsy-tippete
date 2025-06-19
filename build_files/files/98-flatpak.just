install-recommended-flatpaks:
    #!/usr/bin/env bash
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    flatpak install --noninteractive --assumeyes flathub \
            com.google.Chrome \
            dev.vencord.Vesktop \
            hu.irl.cameractrls \
            im.nheko.Nheko \
            io.dbeaver.DBeaverCommunity \
            io.dbeaver.DBeaverCommunity.Client.pgsql \
            io.github.dweymouth.supersonic \
            io.github.flattool.Warehouse \
            it.mijorus.gearlever \
            org.kde.filelight \
            org.kde.francis \
            org.kde.gwenview \
            org.kde.haruna \
            org.kde.isoimagewriter \
            org.kde.kamoso \
            org.kde.kcalc \
            org.kde.kcharselect \
            org.kde.kcolorchooser \
            org.kde.krdc \
            org.kde.krita \
            org.kde.kwalletmanager5 \
            org.kde.kwrite \
            org.kde.okular \
            org.kde.skanpage \
            org.libreoffice.LibreOffice \
            org.mozilla.Thunderbird \
            org.mozilla.firefox \
            org.musicbrainz.Picard \
            org.raspberrypi.rpi-imager \
            org.wezfurlong.wezterm
