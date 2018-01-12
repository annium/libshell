#!/usr/bin/env bash

# lib_delete_from_path /path/to/profile_file /path/to/be/deleted
function lib_delete_from_path {
    local file=$1
    local path=$2

    lib_delete_line_from_file $file 'export PATH=$PATH:'$path
}

export -f lib_delete_from_path