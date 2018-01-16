#!/usr/bin/env bash

# lib_docker_clean_dangling_images
function lib_docker_clean_dangling_images {
    echo "Remove dangling images"
    for id in $(docker images -q --filter "dangling=true"); do
        docker image rm $id > /dev/null
    done
}

export -f lib_docker_clean_dangling_images