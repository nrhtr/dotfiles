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
symlink niri ~/.config/niri
symlink waybar ~/.config/waybar
symlink rtorrent ~/.config/rtorrent
symlink i3status-rust ~/.config/i3status-rust

# home-root dotfiles
symlink nethack/.nethackrc ~/.nethackrc

# scripts — link individual files so ~/bin can coexist with other scripts
mkdir -p ~/bin
for f in "${basedir}/scripts/bin/"*; do
    symlink "scripts/bin/$(basename "$f")" "$HOME/bin/$(basename "$f")"
done
