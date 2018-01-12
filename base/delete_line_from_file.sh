#!/usr/bin/env bash

# lib_delete_line_from_file /path/to/file line goes here
function lib_delete_line_from_file {
    local file=$1
    local line=${@:2}
    
    content=$(cat $file | grep -v "$line")
    echo "$content" > $file
}

export -f lib_delete_line_from_file