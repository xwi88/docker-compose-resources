#!/usr/bin/env bash

# downloaded docker images collect for new nexus init!
# docker images|grep 127.0.0.1|sort|awk -F ' ' '{print $1 "/" $2}'|awk '{print substr($1,16)}'> nexus_downloaded_images

filename=nexus_downloaded_images
docker_hub_url=127.0.0.1:9091
docker_login_user=admin
docker_login_password=admin123


function docker_pull_images(){
    if [[ $1 == "" ]]; then
        exit 1
    fi
    images_url=$1
    docker pull ${docker_hub_url}/${images_url}
}

function docker_login_check(){
    $(docker login ${docker_hub_url} -u ${docker_login_user} -p ${docker_login_password})
    return $?
}

$(docker_login_check)
docker_login_check_ret=$?

if [[ ${docker_login_check_ret} == "1" ]]; then
    echo "occur error, docker login for ${docker_hub_url}"
    exit 1
fi

cat ${filename} | while read line;
do 
    echo "docker image repo: $line"; 
    docker_pull_images ${line}
done
