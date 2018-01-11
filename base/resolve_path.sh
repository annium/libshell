#!/usr/bin/env bash

# libshell_resolve_path /path/to/../some/../file/or/directory
function libshell_resolve_path {
    local path=$1

    if [ -d $path ]; then
        echo $(cd $path && pwd -P)
    else
        echo $(cd $(dirname $path) && pwd -P)/$(basename $path)
    fi
}