#!/bin/bash
cd /home/container

apt install -y Xvfb wine-stable winbind

curl -sSL -o steamcmd.tar.gz http://media.steampowered.com/installer/steamcmd_linux.tar.gz

mkdir -p /srv/csgoserver/steamcmd
tar -xzvf steamcmd.tar.gz -C /srv/csgoserver

# SteamCMD fails otherwise for some reason, even running as root.\
# This is changed at the end of the install process anyways.
chown -R root:root /srv/csgoserver

export HOME=/srv/csgoserver
cd /srv/csgoserver
./steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /srv/csgoserver +app_update 740 validate +quit
export HOME=/srv/csgoserver
