# Update
sudo pacman -Syyu --noconfirm

# Install packages
sudo pacman -S --noconfirm adapta-gtk-theme alacritty discord docker docker-compose dunst feh firefox lsd neofetch neovim picom polybar ripgrep rofi thunar zsh

# Install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay

# Install AUR packages
yay -S --noconfirm auto-cpufreq autotiling layan-cursor-theme-git networkmanager-dmenu-git nvchad-git papirus-icon-theme-stripped  slack-desktop ttf-meslo-nerd-font-powerlevel10k visual-studio-code-bin web-greeter zsh-theme-powerlevel10k-git

# Enable docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker

# Copy config files
sudo cp ~/projects/Arch-Boot/.gitconfig ~/.gitconfig

# Get theme
cd ~
git init
git remote add origin https://github.com/LeoBruant/i3-mountains.git
git fetch --all && git reset --hard origin/master
sudo mkdir /usr/share/backgrounds && sudo mkdir /usr/share/backgrounds/archlinux-login-backgrounds
chmod +x scripts/config.sh && ./scripts/config.sh
alacritty &
exit

