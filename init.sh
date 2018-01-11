#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

for file in $(find ./base -name '*.sh'); do
    source $file
done