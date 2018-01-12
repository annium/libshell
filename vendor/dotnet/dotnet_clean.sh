#!/usr/bin/env bash

# lib_dotnet_clean project_directory
function lib_dotnet_clean {
    local path=$(lib_resolve_path $1)

    for dir in $(find $path -type d -name bin); do
        echo "Remove $dir"
        rm -rf $dir
    done

    for dir in $(find $path -type d -name obj); do
        echo "Remove $dir"
        rm -rf $dir
    done

    for file in $(find $path -type f -name "*.nupkg"); do
        echo "Remove $file"
        rm -f $file
    done
}

export -f lib_dotnet_clean