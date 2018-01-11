#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

source ./init.sh


# get installation folder

default_installation_folder="/opt"
echo "Where to install? ($default_installation_folder)"
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
echo "Which profile file to use? ($default_profile_file)"
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
echo "Which aliases file to use? ($default_aliases_file)"
read aliases_file

if [[ ! -f $aliases_file ]]; then
    aliases_file=$default_aliases_file
fi

if [[ ! -r $aliases_file ]]; then
    echo "Aliases file $aliases_file is not readable. Change permissions to continue."
    exit 1
fi


# copy libshell to installation folder

echo "Installing to $installation_folder..."
rm -rf $installation_folder
mkdir -p $installation_folder
cp -rf base vendor init.sh $installation_folder


# add source instruction to profile_file

echo "Writing source instruction to $profile_file..."
libshell_add_line_to_file $profile_file source $installation_folder/init.sh


# write aliases to profile_file

echo "Writing aliases to $profile_file..."
lattice='#'
while read key value || [[ -n "$value" ]]
do
    # if not comment line and both key and value given - add alias
    if [[ $key != $lattice* ]] && [[ ! -z $key ]] && [[ ! -z $value ]]; then
        libshell_add_alias $profile_file $key $value
    fi
done < $aliases_file


# Report success and give instructions

echo "Success! Restart your shell please"