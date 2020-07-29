#!/usr/bin/env bash

echo "generating default.conf"

cat > /etc/vpnc/default.conf <<EOF
IPSec gateway ${VPNC_GATEWAY}
IPSec ID ${VPNC_ID}
IPSec secret ${VPNC_SECRET}
Xauth username ${VPNC_USERNAME}
Xauth password ${VPNC_PASSWORD}
EOF

if [ ! -z ${VPNC_DOMAIN} ]; then
    echo "Domain ${VPNC_DOMAIN}" >> /etc/vpnc/default.conf
fi

echo "DPD idle timeout (our side) 0" >> /etc/vpnc/default.conf

echo "starting vpnc..."

/usr/sbin/vpnc default --non-inter

echo "running command..."

bash -c "${1}"
