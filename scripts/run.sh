#!/bin/bash
umask ${UMASK}
su - jlf -c "/jellyfin/jellyfin --datadir /config --cachedir /cache --ffmpeg /usr/lib/jellyfin-ffmpeg/ffmpeg"
