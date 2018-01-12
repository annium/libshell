#!/usr/bin/env bash

# configure paths

default_installation_folder="/opt"
default_profile_file="/etc/profile"
default_aliases_file="$HOME/.libshell_aliases"

if [[ $# -eq 0 ]]; then
    installation_folder=$default_installation_folder
    profile_file=$default_profile_file
    aliases_file=$default_aliases_file
else
    installation_folder=${1:-$default_installation_folder}
    profile_file=${2:-$default_profile_file}
    aliases_file=${3:-$default_aliases_file}
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
