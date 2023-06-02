#!/bin/bash

# colors
green=$(tput setaf 2)
none=$(tput sgr0)

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

echo "[${green}+${none}] Copying dotfiles"

# startship
[ ! -d "$HOME/.config/starship/" ] && mkdir "$HOME/.config/starship"
cp "$SCRIPT_ROOT/config/starship/starship.toml" "$HOME/.config/starship/starship.toml" 

# zsh
[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
cp "$SCRIPT_ROOT/config/zsh/zshrc" "$HOME/.zshrc"

# i3
if [ -f "$HOME/.config/i3/config" ]; then
    mv "$HOME/.config/i3/config" "$HOME/.config/i3/config.backup"
fi
cp -R "$SCRIPT_ROOT/config/i3" "$HOME/.config/"

# i3status
if [ -f "$HOME/.config/i3/i3status.conf" ]; then
    mv "$HOME/.config/i3/i3status.conf" "$HOME/.config/i3/i3status.conf.backup"
fi
cp "$SCRIPT_ROOT/config/i3status/i3status.conf" "$HOME/.config/i3/"

echo "${green}Done!${none}"
