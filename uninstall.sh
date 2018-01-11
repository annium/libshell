#!/usr/bin/env bash

set -e

dir=$(dirname "${BASH_SOURCE[0]}")

source $dir/init.sh


# configure paths

default_installation_folder="/opt"
default_profile_file="$HOME/.bash_profile"
default_aliases_file="$HOME/.libshell_aliases"

if [[ $# -eq 0 ]]; then
    installation_folder=$default_installation_folder
    profile_file=$default_profile_file
    aliases_file=$default_aliases_file
else
    installation_folder=${1:-$default_installation_folder}
    installation_folder=${2:-$default_profile_file}
    installation_folder=${3:-$default_aliases_file}
fi

if [[ ! -w $installation_folder ]]; then
    echo "Installation folder $installation_folder is not writable. Change permissions to continue."
    exit 1
fi

installation_folder=$installation_folder/libshell

if [[ ! -w $profile_file ]]; then
    echo "Profile file $profile_file is not writable. Change permissions to continue."
    exit 1
fi


# remove libshell from installation folder

echo "Uninstalling from $installation_folder..."
rm -rf $installation_folder


# remove source instruction from profile_file

echo "Removing source instruction from $profile_file..."
libshell_delete_line_from_file $profile_file source $installation_folder/init.sh


# remove aliases from profile_file

if [[ -r $aliases_file ]]; then
    echo "Removing aliases from $profile_file..."
    lattice='#'
    while read key value || [[ -n "$value" ]]
    do
        # if not comment line and both key and value given - add alias
        if [[ $key != $lattice* ]] && [[ ! -z $key ]] && [[ ! -z $value ]]; then
            libshell_delete_alias $profile_file $key
        fi
    done < $aliases_file
fi


# Report success and give instructions

echo "Success! Restart your shell please"