#!/bin/bash

set -e
set -o pipefail

# Helper function to show commands
function run_cmd() {
  echo -e "\033[1;34m[RUNNING]\033[0m $1"
  eval $1
  echo -e "\033[1;32m[DONE]\033[0m"
}

USER_NAME=$(whoami)

# Update system
run_cmd "sudo pacman -Syu --noconfirm"

# Install main packages pacman
run_cmd "sudo pacman -S --noconfirm hyprland hyprutils hyprland-qtutils hyprpicker hypridle waybar kitty sddm rofi swww swaync wl-clipboard btop unzip unrar xdg-utils xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-user-dirs xdg-user-dirs-gtk python python-pip python-pywal nwg-look sassc pipewire udiskie network-manager-applet pavucontrol pamixer playerctl tlp bluez bluez-utils bluez-tools blueman brightnessctl celluloid loupe gnome-calculator gnome-themes-extra polkit-gnome pacman-contrib vim curl less zsh zsh-syntax-highlighting bash-completion qt5-wayland qt6-wayland noto-fonts noto-fonts-extra noto-fonts-emoji ttf-mononoki-nerd thunar firefox ffmpeg gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer vulkan-radeon lib32-vulkan-radeon gamemode lib32-gamemode mesa lib32-mesa linux-zen linux-zen-headers fzf jq yt-dpl"

# Install yay
if ! command -v yay &>/dev/null; then
  run_cmd "git clone https://aur.archlinux.org/yay.git"
  cd yay
  run_cmd "makepkg -si --noconfirm"
  cd .. && rm -rf yay
fi

# Install AUR packages via yay
run_cmd "yay -S python-pywalfox hyprshot yt-x-git wlogout"

# Install Nordzy Icon Theme
run_cmd "git clone https://github.com/alvatip/Nordzy-icon.git"
cd Nordzy-icon/
run_cmd "./install.sh -c dark"
cd .. && rm -rf Nordzy-icon/

# Install Graphite GTK Theme
run_cmd "git clone https://github.com/vinceliuice/Graphite-gtk-theme.git"
cd Graphite-gtk-theme/
run_cmd "./install.sh -t blue -c dark -s standard --tweaks nord normal rimless"
cd .. && rm -rf Graphite-gtk-theme/

# Install oh-my-zsh, powerlevel10k and plugins
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  run_cmd "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
fi

run_cmd "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \"\${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k\""
run_cmd "git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \"\${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting\""

# Change shell to ZSH
run_cmd "chsh -s $(which zsh)"
run_cmd "chsh -s /bin/zsh"

# Install Rofi launcher with custom themes
run_cmd "git clone --depth=1 https://github.com/adi1090x/rofi.git"
cd rofi/
run_cmd "chmod +x setup.sh"
run_cmd "./setup.sh"
cd .. && rm -rf rofi/

# Copy config files from repository to ~/.config
run_cmd "cp -r .config/* ~/.config/"

# Copy hidden files from repository to home
run_cmd "cp .zshrc .p10k.zsh ~/"

# Adjust Rofi launcher image
sed -i 's|url(.*)|url("~/.config/wallpaper/wallpaper-rofi.png", height)|' ~/.config/rofi/launchers/type-6/style-9.rasi

# Apply wallpaper and theme using pywal and pywalfox
run_cmd "wal -i ~/.config/wallpaper/wallpaper.png"
run_cmd "pywalfox update"

# Install and configure Spicetify
#run_cmd "spicetify"
#run_cmd "spicetify backup apply enable-devtools"
#run_cmd "spicetify update"
#run_cmd "git clone --depth=1 https://github.com/spicetify/spicetify-themes.git"
#cd spicetify-themes/
#run_cmd "cp -r * ~/.config/spicetify/Themes"
#run_cmd "spicetify config current_theme text"
#run_cmd "spicetify apply"
#run_cmd "spicetify config color_scheme Nord"
#run_cmd "spicetify apply"
#cd .. && rm -rf spicetify-themes/

# Add user to groups
run_cmd "sudo usermod -aG wheel $USER_NAME"
run_cmd "sudo usermod -aG lp $USER_NAME"

# Update user directories
run_cmd "xdg-user-dirs-update"

# Set Thunar as default file manager
run_cmd "xdg-mime default thunar.desktop inode/directory"

# Enable services
run_cmd "sudo systemctl enable sddm.service"
run_cmd "sudo systemctl enable bluetooth.service"
run_cmd "sudo systemctl start bluetooth.service"

# Install ZSH plugins and fix zsh
run_cmd "yay -S zsh-syntax-highlighting"
run_cmd "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git"
run_cmd "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
run_cmd "git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/path/to/fsh"

# Give execute permission to gamemode, launch_waybar and killactive scripts
run_cmd "chmod +x ~/.config/hypr/Scripts/gamemode.sh"
run_cmd "chmod +x ~/.config/hypr/Scripts/KillActiveProcess.sh"
run_cmd "chmod +x ~/.config/waybar/scripts/launch-waybar.sh"
run_cmd "chmod +x ~/.config/waybar/scripts/cava.sh"

# Final message
echo -e "\033[1;35m[FINISHED]\033[0m System successfully configured. It is recommended to reboot now."
