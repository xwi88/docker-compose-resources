#!/usr/bin/env bash


function echo_red(){
    # shellcheck disable=SC2124
    local str_info=$@
    echo -e "\033[31m $str_info \033[0m"
    return 0
}

source ./docker-version.sh

echo "${tag_name}"
# shellcheck disable=SC2164
docker build -t "${tag_name}"  -f Dockerfile .
