#!/usr/bin/env bash

# lib_delete_alias /path/to/profile_file alias
function lib_delete_alias {
    local file=$1
    local alias=$2
    
    lib_delete_line_from_file $file alias $alias=
}