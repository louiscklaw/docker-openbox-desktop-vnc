#!/usr/bin/env bash

set -x

docker rmi openbox-android

set -ex

# 01 build openbox as base
cd dockerfiles/openbox
  docker build . -t openbox-android
cd -

# 03 build appium
cd dockerfiles/appium
  docker build . -t openbox-android
cd -

# TODO: resume me
# 02 build android emulator
cd dockerfiles/android
  docker build . -t openbox-android
cd -

# finialize docker
cd dockerfiles/final
  docker build . -t openbox-android
cd -

docker run --rm -it \
  --privileged \
  --device /dev/kvm \
  -v ./share:/share \
  -v ./dockerfiles/final/etc/supervisord-emulator.conf:/etc/supervisord-emulator.conf \
  -p 15900:5900 \
  -p 4723:4723 \
  --name logickee_docker_android openbox-android
