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

# Preparate environment dev
run_cmd "git clone https://aur.archlinux.org/asdf-vm.git && cd asdf-vm && makepkg -si"
run_cmd "asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby"
run_cmd "asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git"
run_cmd "asdf install ruby latest"
run_cmd "asdf install nodejs latest"
run_cmd "asdf set -u ruby latest"
run_cmd "asdf set -u nodejs latest"
run_cmd "gem install rails"

run_cmd "git clone https://github.com/LazyVim/starter ~/.config/nvim"
run_cmd "rm -rf ~/.config/nvim/.git"

run_cmd "yay -S insomnia gitkraken"

# Programs and social media
echo "want to install the programs(Discord, Telegram, Steam, Spotify...)"
read -p "(Y/N)? " option

if [[ $option == "y" ]] || [[ $option == "Y" ]]; then
  run_cmd "sudo pacman -S --noconfirm discord spotify-launcher steam telegram obs-studio snapshot"
  run_cmd "yay -S --noconfirm spicetify-cli spicetify-themes-git"
elif [[ $option == "n" ]] || [[ $option == "N" ]]; then
  echo "No install"
else
  echo ""
fi

echo -e "\033[1;35m[FINISHED]\033[0m System successfully configured."
