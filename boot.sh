# Update
sudo pacman -Syyu --noconfirm

# Install packages
sudo pacman -S --noconfirm alacritty ardour discord docker docker-compose dunst feh firefox flameshot lsd neovim nitch picom polybar rofi thunar zsh

# Install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay

# Install AUR packages
yay -S --noconfirm auto-cpufreq autotiling catppuccin-gtk-theme-mocha layan-cursor-theme-git networkmanager-dmenu-git nv<chad-git papirus-icon-theme-stripped papirus-folders-catppuccin-git slack-desktop ttf-meslo-nerd-font-powerlevel10k visual-studio-code-bin web-greeter zsh-theme-powerlevel10k-git

# Git config
mv ~/projects/Arch-Boot/.gitconfig ~/.gitconfig
mv ~/projects/Arch-Boot/.gitignore_global ~/.gitignore_global
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
echo $(gpg)

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

# Enable docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker

exec zsh
