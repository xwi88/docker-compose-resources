#!/usr/bin/env bash

# shellcheck disable=SC1090
source ./docker-version.sh

# shellcheck disable=SC2154
docker push "${tag_name}"
