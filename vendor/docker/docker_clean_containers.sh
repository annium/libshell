#!/usr/bin/env bash

# lib_docker_clean_containers tag
function lib_docker_clean_containers {
    local tag=$1

    echo "Remove old $tag containers"
    for id in $(docker ps -aq -f "ancestor=$tag"); do
        name=$(docker ps -a --filter "id=$id" --format "{{.Names}}")
        echo "Remove container $name ($id)"
        docker rm $id > /dev/null
    done
}