# libshell

This is a generic helper library, that can be used to simplify scripting.
Main capabilities:
- provides lot of namespaced functions in user namespace, starting from common prefix (`libshell_` for Bash)
- capability to massively define convenient aliases for used functions

## Common instructions
- create `.libshell_aliases` file in place in your home directory (or any other place)
- write aliases in `alias command goes here` format. Command can contain whitespaces - that doesn't matter. Lines, starting from `#` are ignored

## Bash
Defaults for installation/uninstallation:
- installation folder: `/opt`
- profile file: `~/.bash_profile`
- aliases file: `~/.libshell_aliases`

To install, run `./install.sh`.
To uninstall, run `/.uninstall.sh`

## PowerShell
WIP until bash done
