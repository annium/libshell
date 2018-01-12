#!/usr/bin/env bash

# lib_docker_run tag other docker options
function lib_docker_run {
    local tag=$1
    local args=${@:2}
    
    echo "Run container $tag"
    
    docker run --name $tag --rm $tag $args
}