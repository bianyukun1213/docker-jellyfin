FROM nyanmisaka/jellyfin:latest
ENV PUID=99 \
    PGID=100 \
    UMASK=000 \
    TZ=Asia/Shanghai
EXPOSE 8096
VOLUME /cache /config
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo ${TZ} > /etc/timezone && \
    useradd -u ${PUID} -g ${PGID} -s /bin/bash jlf \
    && chown ${PUID}:${PGID} -R /jellyfin \
    && chown ${PUID}:${PGID} /cache \
    && chown ${PUID}:${PGID} /config
ADD /scripts/ /opt/scripts/
ENTRYPOINT ["/opt/scripts/run.sh"]
