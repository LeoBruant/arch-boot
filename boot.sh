# Update
sudo pacman -Syyu --noconfirm

# Install packages
sudo pacman -S --noconfirm alacritty ardour discord docker docker-compose dunst feh firefox flameshot lsd neovim papirus-icon-theme picom polybar rofi thunar zsh

# Install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay

# Install AUR packages
yay -S --noconfirm auto-cpufreq autotiling catppuccin-gtk-theme-mocha layan-cursor-theme-git networkmanager-dmenu-git nitch nvchad-git papirus-folders-catppuccin-git slack-desktop ttf-meslo-nerd-font-powerlevel10k visual-studio-code-bin web-greeter zsh-syntax-highlighting zsh-theme-powerlevel10k-git

# Git config
mv ~/projects/arch-boot/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global user.email "bruantleo@gmail.com"
git config --global user.name "LeoBruant"

# SSH key
ssh-keygen -t ed25519 -C "bruantleo@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub

# GPG key
gpg --full-generate-key
gpg=$(gpg --list-secret-keys --keyid-format=long | grep "sec" | grep -o "/[A-Za-z0-9]*" | grep -o "[A-Za-z0-9]*")
gpg --armor --export $gpg
git config --global user.signingkey $gpg
git config --global commit.gpgsign true

# Get theme
cd
git init
git remote add origin https://github.com/leobruant/arch-mountains
git fetch --all
git reset --hard origin/master
# Folders
papirus-folders -C cat-mocha-sapphire --theme Papirus-Dark
# Lightdm background
sudo mkdir /usr/share/backgrounds
sudo mkdir /usr/share/backgrounds/archlinux-login-backgrounds
sudo mv ~/.config/lightdm.conf /etc/lightdm/lightdm.conf
sudo mv ~/.config/wallpaper.png /usr/share/backgrounds/archlinux-login-backgrounds/wallpaper.png

# Enable docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker

exec zsh
