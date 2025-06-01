#!/bin/bash

set -e

# Caminho do repositório clonado\DOTFILES_DIR="$HOME/dotfiles"

# Atualiza e instala pacotes do pacman
echo "[INFO] Atualizando sistema e instalando pacotes essenciais..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git base-devel

sudo pacman -S --noconfirm \
  hyprland hyprutils hyprland-qtutils hyprpicker hypridle \
  waybar kitty rofi swww swaync xdg-desktop-portal-hyprland \
  python python-pip python-pywal nwg-look sassc pipewire udiskie \
  network-manager-applet pavucontrol pamixer playerctl \
  bluez celluloid loupe gedit gnome-calculator \
  gnome-theme-murrine gnome-themes-extra polkit-gnome \
  pacman-contrib curl less zsh zsh-syntax-highlighting \
  bash-completion qt5-wayland qt6-wayland ttf-mononoki-nerd \
  thunar firefox firefox-i18n-pt-br discord spotify-launcher \
  steam ffmpeg gst-plugins-ugly gst-plugins-good gst-plugins-base \
  gst-plugins-bad gst-libav gstreamer vulkan-radeon lib32-vulkan-radeon \
  gamemode lib32-gamemode mesa lib32-mesa linux-zen linux-zen-headers

# Instala yay se não estiver instalado
if ! command -v yay &>/dev/null; then
  echo "[INFO] Instalando yay..."
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
fi

# Instala pacotes AUR
yay -S --noconfirm python-pywalfox spicetify-cli spicetify-themes-git graphite-gtk-theme-nord-rimless-normal-git

# Instala NordzyIcon
mkdir -p $HOME/.config/.icons
cd $HOME/.config/.icons
if [ ! -d "Nordzy-icon" ]; then
  git clone https://github.com/alvatip/Nordzy-icon
  cd Nordzy-icon
  sudo ./install.sh -d $HOME/.config/.icons -c dark
  cd .. && rm -rf Nordzy-icon
fi

# Instala Oh My Zsh e Powerlevel10k
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "[INFO] Instalando Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \ 
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# Copia os dotfiles
echo "[INFO] Copiando arquivos de configuração..."
cp -r $DOTFILES_DIR/.config/* ~/.config/
cp $DOTFILES_DIR/.zshrc ~/
cp $DOTFILES_DIR/p10k-*.zsh ~/.p10k.zsh

# Executa setup.sh do Rofi
if [ -f "$HOME/.config/rofi/setup.sh" ]; then
  echo "[INFO] Executando setup.sh do Rofi..."
  cd "$HOME/.config/rofi"
  ./setup.sh
  cd -
else
  echo "[WARN] setup.sh do Rofi não encontrado!"
fi

# Ajusta imagem de fundo no Rofi
ROFI_STYLE="$HOME/.config/rofi/launchers/type-6/style-9.rasi"
if [ -f "$ROFI_STYLE" ]; then
  echo "[INFO] Atualizando imagem de fundo do Rofi..."
  sed -i 's|background-image:.*|background-image: url("~/.config/wallpaper/wallpaper-rofi.png", height);|' "$ROFI_STYLE"
fi

# Define o wallpaper
echo "[INFO] Aplicando wallpaper com swww e pywal..."
swww init &
swww img ~/.config/wallpaper/wallpaper.png
pywal -i ~/.config/wallpaper/wallpaper.png
pywalfox update

# Mensagem final
echo "[SUCCESS] Sistema configurado com sucesso! Reinicie para aplicar todos os ajustes."

exit 0
