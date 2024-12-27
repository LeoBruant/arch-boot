# Update
sudo pacman -Syyu --noconfirm

# Install packages
sudo pacman -S --noconfirm \
    ardour \
    croc \
    docker \
    docker-compose \
    flameshot \
    gimp \
    gnome-boxes \
    kitty \
    less \
    lsd \
    nautilus \
    neovim \
    papirus-icon-theme \
    python-pip \
    sddm \
    steam \
    ttf-fira-code \

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm
cd .. && rm -rf yay

# Install AUR packages
yay -S --noconfirm \
    auto-cpufreq \
    balena-etcher \
    catppuccin-gtk-theme-mocha \
    layan-cursor-theme-git \
    nitch \
    opera \
    opera-ffmpeg-codecs \
    papirus-folders-catppuccin-git \
    r2modman-bin \
    slack-desktop \
    ttf-meslo-nerd-font-powerlevel10k \
    vesktop-bin \
    visual-studio-code-insiders-bin

# Get theme
cd ~
git init
git remote add origin https://github.com/leobruant/arch-catppuccin
git fetch --all
git reset --hard origin/kde
git submodule update --init --recursive
git clone --depth=1 \
    https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
papirus-folders -C cat-mocha-sapphire --theme Papirus-Dark

# Zsh
chsh -s /usr/bin/zsh

# Enable docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
