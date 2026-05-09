#!/usr/bin/env bash

basedir=$(cd "$(dirname -- "$0")"; pwd -P)

function symlink() {
    if [[ -e "$2" && ! -L "$2" ]]; then
        echo "$2 exists and is not a symlink. Ignoring it" >&2
        return 1
    fi

    [[ -L "$2" ]] && rm "$2"

    ln -sv "${basedir}/$1" "$2"
}

mkdir -p ~/.config

symlink nvim ~/.config/nvim
symlink sway ~/.config/sway
symlink foot ~/.config/foot
symlink luakit ~/.config/luakit
symlink niri ~/.config/niri
symlink waybar ~/.config/waybar

# scripts
symlink scripts/bin ~/bin
