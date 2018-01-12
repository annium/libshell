#!/usr/bin/env bash

# lib_uninstall_aliases /path/to/profile_file
function lib_uninstall_aliases {
    local profile_file=$(lib_resolve_path $1)
    local aliases_target_file=$(dirname $profile_file)/.libshell_aliases

    if [[ ! -w $profile_file ]]; then
        echo "Profile file $profile_file is not writable. Change permissions to continue."
        exit 1
    fi

    if [[ ! -w $(dirname $profile_file) ]]; then
        echo "Profile file $profile_file directory is not writable. Change permissions to continue."
        exit 1
    fi

    echo "Delete aliases sourcing from $profile_file"
    lib_delete_line_from_file $profile_file "source $aliases_target_file"

    echo "Delete aliases with $aliases_target_file"
    rm -f $aliases_target_file
}