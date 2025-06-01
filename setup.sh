#!/bin/bash

set -e

run_cmd() {
    echo -e "\n\033[1;34m==> $1\033[0m"
    bash -c "$2"
}

# Variáveis
USER_NAME="lacum"
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"
WALLPAPER_DIR="$CONFIG_DIR/wallpaper"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Atualizar sistema
run_cmd "Atualizando pacman..." "sudo pacman -Syu --noconfirm"

# Instalar pacotes base
run_cmd "Instalando pacotes essenciais via pacman..." "
sudo pacman -S --noconfirm git base-devel zsh zsh-syntax-highlighting bash-completion curl less
"

# Instalar pacotes do sistema
run_cmd "sudo pacman -S hyprland hyprutils hyprland-qtutils hyprpicker hypridle waybar kitty sddm rofi swww swaync wl-clipboard xdg-utils xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-user-dirs xdg-user-dirs-gtk python python-pip python-pywal nwg-look sassc pipewire udiskie network-manager-applet pavucontrol pamixer playerctl bluez blueman bluedevil celluloid loupe gedit gnome-calculator gnome-themes-extra polkit-gnome pacman-contrib curl less zsh zsh-syntax-highlighting bash-completion qt5-wayland qt6-wayland noto-fonts noto-fonts-extra noto-fonts-emoji ttf-mononoki-nerd thunar firefox firefox-i18n-pt-br discord spotify-launcher steam ffmpeg gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer vulkan-radeon lib32-vulkan-radeon gamemode lib32-gamemode mesa lib32-mesa linux-zen linux-zen-headers"

# Instalar yay
run_cmd "Instalando yay..." "
cd /opt && sudo git clone https://aur.archlinux.org/yay.git && sudo chown -R $USER:$USER yay && cd yay && makepkg -si --noconfirm
"

# Instalar pacotes via yay
run_cmd "yay -S python-pywalfox spicetify-cli spicetify-themes-git"

# Instalar ícones Nordzy
run_cmd "Instalando ícones Nordzy..." "
mkdir -p $CONFIG_DIR/.icons
git clone https://github.com/alvatip/Nordzy-icon
cd Nordzy-icon
sudo ./install.sh -d $CONFIG_DIR/.icons -c dark
cd .. && rm -rf Nordzy-icon
"

# Instalar tema Graphite
run_cmd "Instalando tema GTK Graphite..." "
mkdir -p $CONFIG_DIR/.themes
git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
cd Graphite-gtk-theme
chmod +x ./install.sh
sudo ./install.sh -d $CONFIG_DIR/.themes -t blue -c dark --tweaks 1 3 4 5
cd .. && rm -rf Graphite-gtk-theme
"

# Clonar e instalar Oh My Zsh e plugins
run_cmd "Instalando Oh My Zsh e plugins..." "
sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\" \"\" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \"$ZSH_CUSTOM/themes/powerlevel10k\"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \"$ZSH_CUSTOM/plugins/fast-syntax-highlighting\"
"

# Clonar e rodar setup do rofi (adi1090x)
run_cmd "Instalando estilos do Rofi (adi1090x)..." "
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
cd .. && rm -rf rofi
"

# Corrigir caminho da imagem no estilo do Rofi
run_cmd "Atualizando imagem no Rofi Launcher..." "
sed -i 's|url(\".*\")|url(\"'"$WALLPAPER_DIR"'/wallpaper-rofi.png\", height)|' \"$CONFIG_DIR/rofi/launchers/type-6/style-9.rasi\"
"

# Copiar dotfiles
run_cmd "Copiando dotfiles para ~/.config..." "
cp -r $DOTFILES_DIR/.config/* $CONFIG_DIR/
"

# Aplicar wallpaper e pywal
run_cmd "Aplicando wallpaper e tema com pywal..." "
swww init
swww img $WALLPAPER_DIR/wallpaper.png
wal -i $WALLPAPER_DIR/wallpaper.png
pywalfox update
"

# Ativar serviços
run_cmd "Ativando serviços..." "
sudo usermod -aG wheel $USER_NAME
sudo usermod -aG lp $USER_NAME
xdg-user-dirs-update
xdg-mime default thunar.desktop inode/directory
sudo systemctl enable sddm.service
sudo systemctl enable bluetooth.service
"

# Trocar shell padrão para zsh
run_cmd "Trocando o shell padrão para Zsh..." "
chsh -s \$(which zsh)
chsh -s /bin/zsh
"

echo -e "\n\033[1;32m✅ Script finalizado com sucesso! Reinicie o sistema para aplicar todas as configurações.\033[0m"

