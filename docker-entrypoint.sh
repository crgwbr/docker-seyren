#!/bin/bash
set -e

# allow the container to be started with `--user`
if [ "$1" = 'run-seyren' -a "$(id -u)" = '0' ]; then
    chown -R seyren /var/lib/seyren
    exec gosu seyren "$BASH_SOURCE" "$@"
fi

exec "$@"
