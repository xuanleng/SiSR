#!/bin/bash
# Ping the gateway; shut down if it is unreachable.
# Typical crontab entry:
#   * * * * * /usr/local/bin/powercheck.sh
# Override the gateway with GATEWAY=192.168.1.1 if needed.

set -u
GATEWAY="${GATEWAY:-192.168.1.1}"
PING_COUNT="${PING_COUNT:-2}"

if ! ping -c "$PING_COUNT" -W 2 "$GATEWAY" >/dev/null 2>&1; then
    logger -t powercheck "gateway ${GATEWAY} unreachable; shutting down"
    /sbin/shutdown -h now
fi
