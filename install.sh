#!/usr/bin/env bash

set -e

dir=$(dirname "${BASH_SOURCE[0]}")

source $dir/init.sh

source $dir/installation_configuration.sh


# copy libshell to installation folder

echo "Installing to $installation_folder"
rm -rf $installation_folder
mkdir -p $installation_folder
cp -rf base vendor init.sh $installation_folder


# add source instruction to profile_file

echo "Writing source instruction to $profile_file"
lib_add_line_to_file $profile_file source $installation_folder/init.sh


# write aliases to profile_file

if [[ -r $aliases_file ]]; then
    echo "Writing aliases to $profile_file"
    lattice='#'
    while read key value || [[ -n "$value" ]]
    do
        # if not comment line and both key and value given - add alias
        if [[ $key != $lattice* ]] && [[ ! -z $key ]] && [[ ! -z $value ]]; then
            lib_delete_alias $profile_file $key
            lib_add_alias $profile_file $key $value
        fi
    done < $aliases_file
fi


# Report success and give instructions

echo "Success! Restart your shell please"