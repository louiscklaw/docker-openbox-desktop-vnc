#!/usr/bin/env bash

set -ex


/usr/bin/supervisord --configuration ${SUPERVISORD_CONFIG_PATH}/supervisord-screen.conf &

wait
