#!/bin/bash

SCRIPT_ROOT=$(pwd)

# startship
[ ! -d "$HOME/.config/startship/" ] && mkdir "$HOME/.config/starship"
cp "$SCRIPT_ROOT/startship/starship.toml" "$HOME/.config/starship/" 

# zsh
[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
cp "$SCRIPT_ROOT/zsh/zshrc" "$HOME/.zshrc"

# i3
if [ -f "$HOME/.config/i3/config" ]; then
    mv "$HOME/.config/i3/config" "$HOME/.config/i3/config.backup"
fi
cp -R "$SCRIPT_ROOT/i3" "$HOME/.config/"

# i3status
if [ -f "$HOME/.config/i3/i3status.conf"]; then
    mv "$HOME/.config/i3/i3status.conf" "$HOME/.config/i3/i3status.conf.backup"
fi
cp "$SCRIPT_ROOT/i3status/i3status.conf" "$HOME/.config/i3/"
