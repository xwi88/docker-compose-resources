#!/usr/bin/env bash

# shellcheck disable=SC1090
source ./docker-version.sh
# shellcheck disable=SC2154
echo "docker tag:${tag_name}"

# docker volume need the absolute path
docker run -it --name v8fg-go-test --rm ${tag_name}
