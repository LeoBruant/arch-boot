# Update
sudo pacman -Syyu --noconfirm

# Install packages
sudo pacman -S --noconfirm alacritty ardour discord docker docker-compose firefox flameshot lsd neovim papirus-icon-theme zsh

# Install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay

# Install AUR packages
yay -S --noconfirm auto-cpufreq betterlockscreen catppuccin-gtk-theme-mocha gnome-shell-extension-blur-my-shell gnome-shell-extension-dash-to-dock gnome-shell-extension-pop-shell layan-cursor-theme-git networkmanager nitch papirus-folders-catppuccin-git slack-desktop ttf-meslo-nerd-font-powerlevel10k visual-studio-code-insiders-bin web-greeter 

# Git config
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

# Switch display manager
sudo systemctl disable gdm
sudo systemctl enable lightdm

# Get theme
cd
git init
git remote add origin https://github.com/leobruant/arch-catppuccin
git fetch --all
git reset --hard origin/gnome
git submodule update --init --recursive
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Folders
papirus-folders -C cat-mocha-sapphire --theme Papirus-Dark
# Lightdm background
sudo cp ~/.config/lightdm.conf /etc/lightdm/lightdm.conf
sudo cp ~/.config/wallpaper.jpg /usr/share/backgrounds/archlinux-login-backgrounds/wallpaper.jpg
# Betterlockscreen background
betterlockscreen -u ~/.config/wallpaper.jpg

# Zsh
chsh -s /usr/bin/zsh

# Enable docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
