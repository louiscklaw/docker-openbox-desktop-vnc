#!/usr/bin/env bash

set -ex

docker rmi openbox-android

# 01 build openbox as base
cd dockerfiles/01_openbox
  docker build . -t openbox-android
cd -

# 02 build android emulator
cd dockerfiles/02_android
  docker build . -t openbox-android
cd -

# 03 build appium
cd dockerfiles/03_appium
  docker build . -t openbox-android
cd -

# finialize docker
cd dockerfiles/99_finialize
  docker build . -t openbox-android
cd -


# docker build . -t logickee/docker_android
# docker build -f ./Dockerfile.android . -t openbox-android

docker run --rm \
  --privileged \
  --device /dev/kvm \
  -v ./share:/share \
  -p 15900:5900 \
  -p 4723:4723 \
  --name logickee_docker_android openbox-android
