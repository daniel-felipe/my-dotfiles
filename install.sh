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

# zsh
printf "Zsh\t"
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 &> /dev/null
[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
cp "$SCRIPT_ROOT/config/zsh/zshrc" "$HOME/.zshrc"
status

# hyprland
printf "Hypr\t\t"
cp -R "$SCRIPT_ROOT/config/hypr" "$HOME/.config/"
status

# i3status
printf "Waybar\t"
cp "$SCRIPT_ROOT/waybar" "$HOME/.config/"
status

# rofi
printf "Wofi\t\t"
cp -R "$SCRIPT_ROOT/config/wofi" "$HOME/.config/"
status

# rofi
printf "Swaylock\t\t"
cp -R "$SCRIPT_ROOT/config/swaylock" "$HOME/.config/"
status

# kitty 
printf "Kitty\t\t"
cp -R "$SCRIPT_ROOT/config/kitty" "$HOME/.config/"
status

echo "[${green}+${none}]All done!"

