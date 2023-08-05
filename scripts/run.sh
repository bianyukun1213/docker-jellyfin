#!/bin/bash
groupmod -o -g ${PGID} jlf
usermod -u ${PUID} jlf
homedir="/home/jlf"
if [ ! -d ${homedir} ]; then
   mkdir -p ${homedir}
fi
chown ${PUID}:${PGID} ${homedir}
chown ${PUID}:${PGID} -R /jellyfin
chown ${PUID}:${PGID} /cache
chown ${PUID}:${PGID} /config
chown ${PUID}:${PGID} /media
umask ${UMASK}
su - jlf -c "/jellyfin/jellyfin --datadir /config --cachedir /cache --ffmpeg /usr/lib/jellyfin-ffmpeg/ffmpeg"
