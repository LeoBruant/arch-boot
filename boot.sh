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
    less \
    lsd \
    nautilus \
    neovim \
    python-pip \
    sddm \
    steam \
    ttf-fira-code \
    zsh \
    zsh-synthax-highlighting

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm
cd .. && rm -rf yay

# Install AUR packages
yay -S --noconfirm \
    auto-cpufreq \
    balena-etcher \
    catppuccin-gtk-theme-mocha \
    ghostty \
    layan-cursor-theme-git \
    nitch \
    oh-my-zsh-git \
    opera \
    opera-ffmpeg-codecs-bin \
    papirus-folders-catppuccin-git \
    r2modman-bin \
    slack-desktop \
    ttf-meslo-nerd-font-powerlevel10k \
    vesktop-bin \
    visual-studio-code-insiders-bin \
    zsh-theme-powerlevel10k-git

# Get dotfiles
cd ~
git init
git remote add origin https://github.com/leobruant/dotfiles
git fetch --all
git reset --hard origin/kde

# Set folders colors
papirus-folders -C cat-mocha-sapphire --theme Papirus-Dark

# Zsh
chsh -s /usr/bin/zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Enable auto-cpufreq
sudo systemctl enable --now auto-cpufreq

# Enable docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
