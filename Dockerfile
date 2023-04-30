FROM nyanmisaka/jellyfin:latest

LABEL org.opencontainers.image.authors="HeyHollis" \
    org.opencontainers.image.source="https://github.com/bianyukun1213/docker-jellyfin"

ENV PUID=99 \
    PGID=100 \
    UMASK=000 \
    TZ=Asia/Shanghai
EXPOSE 8096
VOLUME /cache /config /media
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo ${TZ} > /etc/timezone && \
    useradd -u ${PUID} -g ${PGID} -s /bin/bash jlf \
    && chown ${PUID}:${PGID} -R /jellyfin \
    && chown ${PUID}:${PGID} /cache \
    && chown ${PUID}:${PGID} /config \
    && chown ${PUID}:${PGID} /media
ADD /scripts/ /opt/scripts/
ENTRYPOINT ["/opt/scripts/run.sh"]
