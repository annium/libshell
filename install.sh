#!/usr/bin/env bash

set -e

dir=$(dirname "${BASH_SOURCE[0]}")

source $dir/init.sh

source $dir/installation_configuration.sh


# copy libshell to installation folder

echo "Install to $installation_folder"
rm -rf $installation_folder
mkdir -p $installation_folder
cp -rf \
    $dir/base \
    $dir/vendor \
    $dir/init.sh \
    $installation_folder


# add source instruction to profile_file

echo "Write source instruction to $profile_file"
lib_add_line_to_file $profile_file source $installation_folder/init.sh


# Report success and give instructions

echo "Success! Restart your shell please"