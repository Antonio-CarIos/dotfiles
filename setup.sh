#!/bin/bash

set -e
set -o pipefail

# Função auxiliar para mostrar comandos
function run_cmd() {
    echo -e "\033[1;34m[EXECUTANDO]\033[0m $1"
    eval $1
    echo -e "\033[1;32m[OK]\033[0m"
}

# Atualizar sistema
run_cmd "sudo pacman -Syu --noconfirm"

# Instalar pacotes base
run_cmd "sudo pacman -S --noconfirm git base-devel"

# Instalar pacotes principais via pacman
run_cmd "sudo pacman -S --needed --noconfirm yprland hyprutils hyprland-qtutils hyprpicker hypridle waybar kitty sddm rofi swww swaync wl-clipboard xdg-utils xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-user-dirs xdg-user-dirs-gtk python python-pip python-pywal nwg-look sassc pipewire udiskie network-manager-applet pavucontrol pamixer playerctl bluez blueman bluedevil celluloid loupe gedit gnome-calculator gnome-theme-murrine gnome-themes-extra polkit-gnome pacman-contrib curl less zsh zsh-syntax-highlighting bash-completion qt5-wayland qt6-wayland noto-fonts noto-fonts-extra noto-fonts-emoji ttf-mononoki-nerd thunar firefox firefox-i18n-pt-br discord spotify-launcher steam ffmpeg gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer vulkan-radeon lib32-vulkan-radeon gamemode lib32-gamemode mesa lib32-mesa linux-zen linux-zen-headers"

# Instalar yay
if ! command -v yay &> /dev/null; then
    run_cmd "git clone https://aur.archlinux.org/yay.git"
    cd yay
    run_cmd "makepkg -si --noconfirm"
    cd .. && rm -rf yay
fi

# Instalar pacotes via yay
run_cmd "yay -S --needed --noconfirm python-pywalfox spicetify-cli spicetify-themes-git graphite-gtk-theme-nord-rimless-normal-git"

# Instalar Nordzy Icon Theme
mkdir -p "$HOME/.config/.icons"
run_cmd "git clone https://github.com/alvatip/Nordzy-icon"
cd Nordzy-icon/
run_cmd "sudo ./install.sh -d $HOME/.config/.icons -c dark"
cd .. && rm -rf Nordzy-icon/

# Instalar oh-my-zsh, powerlevel10k e plugins
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    run_cmd "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
fi

run_cmd "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \"\${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k\""
run_cmd "git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \"\${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting\""

# Instalar temas do Spicetify
run_cmd "git clone --depth=1 https://github.com/spicetify/spicetify-themes.git"
cd spicetify-themes
cp -r * ~/.config/spicetify/Themes
spicetify config current_theme text
spicetify config color_scheme Nord
spicetify apply
cd .. && rm -rf spicetify-themes

# Aplicar imagem e tema com pywal e pywalfox
run_cmd "wal -i ~/.config/wallpaper/wallpaper.png"
run_cmd "pywalfox update"

# Ajustar imagem do Rofi launcher
sed -i 's|url(.*)|url("~/.config/wallpaper/wallpaper-rofi.png", height);|' ~/.config/rofi/launchers/type-6/style-9.rasi

# Executar setup do Rofi
chmod +x ~/.config/rofi/setup.sh
~/.config/rofi/setup.sh

# Aplicar papel de parede
run_cmd "swww init"
sleep 1
run_cmd "swww img ~/.config/wallpaper/wallpaper.png"

# Adicionar usuário aos grupos
run_cmd "sudo usermod -aG wheel lacum"
run_cmd "sudo usermod -aG lp lacum"

# Atualizar diretórios do usuário
run_cmd "xdg-user-dirs-update"

# Definir Thunar como gerenciador padrão
run_cmd "xdg-mime default thunar.desktop inode/directory"

# Ativar serviços
run_cmd "sudo systemctl enable sddm.service"
run_cmd "sudo systemctl enable bluetooth.service"
run_cmd "sudo systemctl start bluetooth.service"

# Mensagem final
echo -e "\033[1;35m[FINALIZADO]\033[0m Sistema configurado com sucesso. Recomenda-se reiniciar agora."
