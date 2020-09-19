#!/bin/bash

# Ubuntu (GNOME) 18.04 setup script.


dpkg -l | grep -qw gdebi || sudo apt-get install -yyq gdebi

# Initial Software

sudo apt update

# Remove undesirable packages:

sudo apt purge gstreamer1.0-fluendo-mp3 deja-dup shotwell whoopsie whoopsie-preferences -yy

# Remove snaps and get packages from apt:

sudo snap remove gnome-characters gnome-calculator gnome-system-monitor
sudo apt install gnome-characters gnome-calculator gnome-system-monitor \
gnome-software-plugin-flatpak -yy

## Remove junk
sudo apt-get remove ubuntu-web-launchers thunderbird rhythmbox -y

## Disable Apport
sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

# Code I found online (not mine)
sudo apt-get remove account-plugin-facebook \
account-plugin-flickr account-plugin-jabber \
account-plugin-salut account-plugin-twitter \
account-plugin-windows-live account-plugin-yahoo \
aisleriot brltty duplicity empathy empathy-common example-content \
gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines \
gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects gnomine \
landscape-common libreoffice-avmedia-backend-gstreamer libreoffice-base-core \
libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw \
libreoffice-gnome libreoffice-gtk libreoffice-impress libreoffice-math \
libreoffice-ogltrans libreoffice-pdfimport libreoffice-style-galaxy \
libreoffice-style-human libreoffice-writer libsane libsane-common \
mcp-account-manager-uoa python3-uno rhythmbox rhythmbox-plugins \
rhythmbox-plugin-zeitgeist sane-utils shotwell shotwell-common \
telepathy-gabble telepathy-haze telepathy-idle telepathy-indicator \
telepathy-logger telepathy-mission-control-5 telepathy-salut \
totem totem-common totem-plugins printer-driver-brlaser printer-driver-foo2zjs \
printer-driver-foo2zjs-common printer-driver-m2300w printer-driver-ptouch printer-driver-splix

# Gotta reboot now:
sudo apt update && sudo apt upgrade -y

echo $'\n'$"*** All done! Please reboot now. ***"
