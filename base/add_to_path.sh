#!/usr/bin/env bash

# lib_add_to_path /path/to/profile_file /path/to/be/added
function lib_add_to_path {
    local file=$1
    local path=$2

    lib_add_line_to_file $file 'export PATH=$PATH:'$path
}

export -f lib_add_to_path