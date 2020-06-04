#!/usr/bin/env bash

# image info, version may auto update
tag_version=1.14.4
domain=xwi999
image_repo=${domain}/golang
# shellcheck disable=SC2034
tag_name=${image_repo}:${tag_version}
