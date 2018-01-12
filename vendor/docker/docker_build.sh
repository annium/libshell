#!/usr/bin/env bash

# lib_docker_build tag Dockerfile
function lib_docker_build {
    local tag=$1
    local dockerfile=$2
    local args=${@:3}
    
    lib_docker_clean_images $tag
    
    echo "Building $tag image from $dockerfile..."
    docker build -f $dockerfile -t $tag $args
}