#!/usr/bin/env bash

set -e

dir=$(dirname "${BASH_SOURCE[0]}")

source $dir/init.sh


# get installation folder

default_installation_folder="/opt"
echo "Where libshell was installed? ($default_installation_folder)"
read installation_folder

if [[ ! -d $installation_folder ]]; then
    installation_folder=$default_installation_folder
fi

if [[ ! -w $installation_folder ]]; then
    echo "Installation folder $installation_folder is not writable. Change permissions to continue."
    exit 1
fi

installation_folder=$installation_folder/libshell


# get profile file

default_profile_file="$HOME/.bash_profile"
echo "Which profile file was used? ($default_profile_file)"
read profile_file

if [[ ! -f $profile_file ]]; then
    profile_file=$default_profile_file
fi

if [[ ! -w $profile_file ]]; then
    echo "Profile file $profile_file is not writable. Change permissions to continue."
    exit 1
fi


# get aliases file

default_aliases_file="$HOME/.libshell_aliases"
echo "Which aliases file was used? ($default_aliases_file)"
read aliases_file

if [[ ! -f $aliases_file ]]; then
    aliases_file=$default_aliases_file
fi

if [[ ! -r $aliases_file ]]; then
    echo "Aliases file $aliases_file is not readable. Change permissions to continue."
    exit 1
fi


# remove libshell from installation folder

echo "Uninstalling from $installation_folder..."
rm -rf $installation_folder


# remove source instruction from profile_file

echo "Removing source instruction from $profile_file..."
libshell_delete_line_from_file $profile_file source $installation_folder/init.sh


# remove aliases from profile_file

echo "Removing aliases from $profile_file..."
lattice='#'
while read key value || [[ -n "$value" ]]
do
    # if not comment line and both key and value given - add alias
    if [[ $key != $lattice* ]] && [[ ! -z $key ]] && [[ ! -z $value ]]; then
        libshell_delete_alias $profile_file $key
    fi
done < $aliases_file


# Report success and give instructions

echo "Success! Restart your shell please"