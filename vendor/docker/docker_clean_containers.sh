#!/usr/bin/env bash

# libshell_docker_clean_containers tag
function libshell_docker_clean_containers {
    local tag=$1

    echo "Removing old $tag containers..."
    for id in $(docker ps -aq -f "ancestor=$tag"); do
        name=$(docker ps -a --filter "id=$id" --format "{{.Names}}")
        echo "Removing container $name ($id)"
        docker rm $id > /dev/null
    done
}