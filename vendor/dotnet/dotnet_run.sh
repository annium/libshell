#!/usr/bin/env bash

# lib_dotnet_run project_directory args go here
function lib_dotnet_run {
    local path=$(lib_resolve_path $1)
    local project=$(find $path -maxdepth 1 -name *.csproj | head -n 1)
    local name=$(basename $project .csproj)
    local args=${@:2}

    if [ ! -d $path/bin ]; then
        dotnet build $project
    fi

    dotnet $(find $path/bin -name "$name.dll" | head -n 1) $args
}