#!/usr/bin/env bash

# lib_add_line_to_file /path/to/file line goes here
function lib_add_line_to_file {
    local file=$1
    local line=${@:2}
    
    if [[ $(grep -q "$line" $file; echo $?) -eq 1 ]]; then
        echo $line >> $file
    fi
}

export -f lib_add_line_to_file