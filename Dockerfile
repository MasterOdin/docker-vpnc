FROM debian:buster-slim

RUN apt-get update -y \
    && apt-get install -y vpnc \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "/entrypoint.sh" ]
