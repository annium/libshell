#!/usr/bin/env bash

# libshell_delete_line_from_file /path/to/file line goes here
function libshell_delete_line_from_file {
    local file=$1
    local line=${@:2}
    
    content=$(cat $file | grep -v "$line")
    echo "$content" > $file
}