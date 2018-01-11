#!/usr/bin/env bash

dir=$(dirname "${BASH_SOURCE[0]}")

for file in $(find $dir/base $dir/vendor -name '*.sh'); do
    source $file
done