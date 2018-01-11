#!/usr/bin/env bash

# libshell_docker_build tag Dockerfile
function libshell_docker_build {
    local tag=$1
    local dockerfile=$2
    local args=${@:3}
    
    libshell_docker_clean_images $tag
    
    echo "Building $tag image from $dockerfile..."
    docker build -f $dockerfile -t $tag $args
}