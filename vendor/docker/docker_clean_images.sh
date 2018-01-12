#!/usr/bin/env bash

# lib_docker_clean_images tag
function lib_docker_clean_images {
    local tag=$1

    echo "Removing old $tag images"
    for id in $(docker images -q $tag); do
        echo "Removing image $id"
        docker image rm $id > /dev/null
    done
}