#!/usr/bin/env bash

# libshell_docker_attach name
function libshell_docker_attach {
    local name=$1

    echo "Attaching to container $name..."

    docker exec \
        -it \
        $name \
        /bin/bash
}