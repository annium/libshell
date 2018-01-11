#!/usr/bin/env bash

# libshell_delete_alias /path/to/profile_file alias
function libshell_delete_alias {
    local file=$1
    local alias=$2
    
    libshell_delete_line_from_file $file alias $alias=
}