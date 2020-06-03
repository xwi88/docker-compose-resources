#!/usr/bin/env bash

# image info, version may auto update
tag_version=3.12
domain=xwi88
image_repo=${domain}/alpine
# shellcheck disable=SC2034
tag_name=${image_repo}:${tag_version}
