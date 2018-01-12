#!/usr/bin/env bash

set -e

dir=$(dirname "${BASH_SOURCE[0]}")

source $dir/init.sh

source $dir/installation_configuration.sh


# remove libshell from installation folder

echo "Uninstall from $installation_folder"
rm -rf $installation_folder


# remove source instruction from profile_file

echo "Remove source instruction from $profile_file"
lib_delete_line_from_file $profile_file source $installation_folder/init.sh


# Report success and give instructions

echo "Success! Restart your shell please"