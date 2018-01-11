#!/usr/bin/env bash

# libshell_dotnet_clean project_directory
function libshell_dotnet_clean {
    local path=$(libshell_resolve_path $1)

    for dir in $(find $path -type d -name bin); do
        echo "Removing $dir"
        rm -rf $dir
    done

    for dir in $(find $path -type d -name obj); do
        echo "Removing $dir"
        rm -rf $dir
    done

    for file in $(find $path -type f -name "*.nupkg"); do
        echo "Removing $file"
        rm -f $file
    done
}