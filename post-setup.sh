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

# Solve Zsh message error
run_cmd "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git"

echo -e "\033[1;35m[FINISHED]\033[0m System successfully configured."