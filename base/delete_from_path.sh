#!/usr/bin/env bash

# libshell_delete_from_path /path/to/profile_file /path/to/be/deleted
function libshell_delete_from_path {
    local file=$1
    local path=$2

    libshell_delete_line_from_file $file 'export PATH=$PATH:'$path
}