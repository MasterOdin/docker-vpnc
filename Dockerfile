FROM debian:buster-slim

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
    && apt-get update -y \
    && apt-get install -y vpnc subversion git rsync \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "/entrypoint.sh" ]
