# Update
sudo pacman -Syyu --noconfirm

# Install packages
sudo pacman -S --noconfirm alacritty discord docker docker-compose dunst feh firefox flameshot lsd neofetch neovim picom polybar ripgrep rofi thunar zsh zsh-syntax-highlighting zsh-theme-powerlevel10k

# Install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay

# Install AUR packages
yay -S --noconfirm auto-cpufreq autotiling catppuccin-gtk-theme-mocha layan-cursor-theme-git networkmanager-dmenu-git nvchad-git papirus-icon-theme-stripped  slack-desktop ttf-meslo-nerd-font-powerlevel10k visual-studio-code-bin web-greeter

# Enable docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp dock

# Copy config files
mv ~/projects/Arch-Boot/.gitconfig ~/.gitconfig

# Get theme
cd
git init
git remote add origin https://github.com/leobruant/arch-mountains
git fetch --all
git reset --hard origin/master
sudo mkdir /usr/share/backgrounds
sudo mkdir /usr/share/backgrounds/archlinux-login-backgrounds
sudo mv ~/.config/lightdm.conf /etc/lightdm/lightdm.conf
sudo mv ~/.config/lightdm.jpg /usr/share/backgrounds/archlinux-login-backgrounds/lightdm.jpg
alacritty &

exit

