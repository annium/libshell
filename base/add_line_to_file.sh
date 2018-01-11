#!/usr/bin/env bash

# libshell_add_line_to_file /path/to/file line goes here
function libshell_add_line_to_file {
    local file=$1
    local line=${@:2}
    
    if [[ $(grep -q "$line" $file; echo $?) -eq 1 ]]; then
        echo $line >> $file
    fi
}