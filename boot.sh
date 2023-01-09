# Update
sudo pacman -Syu --noconfirm

# Install packages
sudo pacman -S --noconfirm adapta-gtk-theme alacritty discord docker-compose feh firefox lsd lxappearance neofetch neovim papirus-icon-theme picom polybar ripgrep rofi thunar zsh

# Install yay
cd ~ && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd ~ && rm -rf yay

# Install AUR packages
yay -S --noconfirm layan-cursor-theme-git networkmanager-dmenu-git slack-desktop ttf-meslo-nerd-font-powerlevel10k visual-studio-code-bin web-greeter wired zsh-theme-powerlevel10k-git

# Enable services
sudo systemctl enable docker
#gpasswd -a user docker

# Get theme
git init
git remote add origin https://github.com/LeoBruant/i3-mountains.git
git fetch --all
git reset --hard origin/master
sudo mkdir /usr/share/backgrounds
sudo mkdir /usr/share/backgrounds/archlinux-login-backgrounds
chmod +x config.sh
config.sh

# Copy config files
sudo cp ~/projects/Arch-Boot/.gitconfig ~/.gitconfig

# Aliases
alias ls=lsd
alias update='sudo pacman -Syyu'

# Restart shell
exec zsh
