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
    groupadd -g 9981 jlf && \
    useradd -u 9981 -g jlf -d /home/jlf -s /bin/bash jlf
ADD /scripts/ /opt/scripts/
ENTRYPOINT ["/opt/scripts/run.sh"]
