# Update
sudo pacman -Syyu --noconfirm

# Install packages
sudo pacman -S --noconfirm alacritty docker docker-compose firefox flameshot lsd neovim opera papirus-icon-theme ttf-fira-code zsh

# Install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay

# Install AUR packages
yay -S --noconfirm auto-cpufreq catppuccin-gtk-theme-mocha gnome-shell-extension-blur-my-shell gnome-shell-extension-dash-to-dock gnome-shell-extension-pop-shell layan-cursor-theme-git networkmanager nitch papirus-folders-catppuccin-git slack-desktop ttf-meslo-nerd-font-powerlevel10k visual-studio-code-insiders-bin vesktop-bin

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

# Get extensions settings
sudo mv /extensions /usr/share/gnome-shell/extensions

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

# Zsh
chsh -s /usr/bin/zsh

# Enable docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
