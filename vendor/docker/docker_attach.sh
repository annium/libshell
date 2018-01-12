#!/usr/bin/env bash

# lib_docker_attach name
function lib_docker_attach {
    local name=$1

    echo "Attaching to container $name..."

    docker exec \
        -it \
        $name \
        /bin/bash
}