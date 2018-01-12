#!/usr/bin/env bash

# lib_install_aliases /path/to/profile_file /path/to/aliases_file
function lib_install_aliases {
    local profile_file=$(lib_resolve_path $1)
    local aliases_source_file=$(lib_resolve_path $2)
    local aliases_target_file=$profile_file.libshell_aliases

    if [[ ! -w $profile_file ]]; then
        echo "Profile file $profile_file is not writable. Change permissions to continue."
        exit 1
    fi

    if [[ ! -w $(dirname $profile_file) ]]; then
        echo "Profile file $profile_file directory is not writable. Change permissions to continue."
        exit 1
    fi
    
    if [[ ! -r $aliases_source_file ]]; then
        echo "Aliases file $aliases_source_file is not readable. Change permissions to continue."
        exit 1
    fi

    echo "Write aliases sourcing to $profile_file"
    lib_add_line_to_file $profile_file "source $aliases_target_file"

    echo "Write aliases to $aliases_target_file"
    rm -f $aliases_target_file
    touch $aliases_target_file
    lattice='#'
    while read key value || [[ -n "$value" ]]
    do
        # if not comment line and both key and value given - add alias
        if [[ $key != $lattice* ]] && [[ ! -z $key ]] && [[ ! -z $value ]]; then
            lib_add_alias $aliases_target_file $key $value
        fi
    done < $aliases_source_file
}