#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# colors
green=$(tput setaf 2)
red=$(tput setaf 1)
none=$(tput sgr0)

status() {
    if [ $? -eq 0 ]; then
        echo "[${green}OK${none}]"
    else
        echo "[${red}ERROR${none}]"
    fi
}

echo "[${green}+${none}] Copying dotfiles"

# startship
printf "Startship\t"
[ ! -d "$HOME/.config/starship/" ] && mkdir "$HOME/.config/starship"
cp "$SCRIPT_ROOT/config/starship/starship.toml" "$HOME/.config/starship/starship.toml"
status

# zsh
printf "Zsh\t"
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 &> /dev/null
[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
cp "$SCRIPT_ROOT/config/zsh/zshrc" "$HOME/.zshrc"
status

# i3
printf "i3\t\t"
if [ -f "$HOME/.config/i3/config" ]; then
    mv "$HOME/.config/i3/config" "$HOME/.config/i3/config.backup"
fi
cp -R "$SCRIPT_ROOT/config/i3" "$HOME/.config/"
status

# i3status
printf "i3status\t"
if [ -f "$HOME/.config/i3/i3status.conf" ]; then
    mv "$HOME/.config/i3/i3status/i3status.conf" "$HOME/.config/i3/i3status/i3status.conf.backup"
fi
cp "$SCRIPT_ROOT/config/i3/i3status/i3status.conf" "$HOME/.config/i3/i3status"
status

# rofi
printf "rofi\t\t"
if [ -f "$HOME/.config/rofi/config.rasi" ]; then
    mv "$HOME/.config/rofi/config.rasi" "$HOME/.config/rofi/config.rasi.backup"
fi
cp -R "$SCRIPT_ROOT/config/rofi" "$HOME/.config/rofi"
status

# kitty
printf "kitty\t\t"
cp -R "$SCRIPT_ROOT/config/kitty/" "$HOME/.config/"

# wallpapers
cp -R "$SCRIPT_ROOT/assets/wallpapers" "$HOME/.local/share/wallpapers/"

echo "${green}Done!${none}"
