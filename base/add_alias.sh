#!/usr/bin/env bash

# lib_add_alias /path/to/profile_file alias value goes here
function lib_add_alias {
    local file=$1
    local alias=$2
    local value=${@:3}

    lib_add_line_to_file $file alias $alias="'"$value"'"
}