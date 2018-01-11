#!/usr/bin/env bash

# libshell_docker_run tag other docker options
function libshell_docker_run {
    local tag=$1
    local args=${@:2}
    
    echo "Running container $tag..."
    
    docker run --name $tag --rm $tag $args
}