#!/bin/bash

set -e
set -o pipefail

# Helper function to show commands
function run_cmd() {
    echo -e "\033[1;34m[RUNNING]\033[0m $1"
    eval $1
    echo -e "\033[1;32m[DONE]\033[0m"
}

# Set wallpaper
run_cmd "swww img ~/.config/wallpaper/wallpaper.png"

# Install Nordzy Icon Theme
mkdir -p "$HOME/.config/.icons"
run_cmd "git clone https://github.com/alvatip/Nordzy-icon"
cd ~/.config/.icons/Nordzy-icon/
run_cmd "./install.sh -d $HOME/.config/.icons -c dark"
cd .. && rm -rf Nordzy-icon/

# Install Graphite GTK Theme
mkdir -p "$HOME/.config/.themes"
run_cmd "git clone https://github.com/vinceliuice/Graphite-gtk-theme.git"
cd ~/.config/.themes/Graphite-gtk-theme
run_cmd "./install.sh -d ~/.config/.themes -t blue -c dark -s standard --tweaks nord normal rimless"
cd .. && rm -rf Graphite-gtk-theme/

# Solve Zsh error
run_cmd "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git"

echo -e "\033[1;35m[FINISHED]\033[0m System successfully configured."