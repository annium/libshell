#!/usr/bin/env bash

# libshell_add_to_path /path/to/profile_file /path/to/be/added
function libshell_add_to_path {
    local file=$1
    local path=$2

    libshell_add_line_to_file $file 'export PATH=$PATH:'$path
}