sudo pacman -Syu --noconfirm &&
sudo pacman -S --noconfirm adapta-gtk-theme alacritty discord docker docker-compose firefox git lxappearance neovim papirus-icon-theme picom polybar ripgrep rofi sddm thunar zsh &&
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd ~ && rm -rf yay &&
yay -S --noconfirm layan-cursor-theme-git networkmanager-dmenu-git slack-desktop ttf-meslo-nerd-font-powerlevel10k visual-studio-code-bin wired zsh-theme-powerlevel10k-git
sudo mv .gitconfig ~/.gitconfig &&
git init &&
git remote add origin https://github.com/LeoBruant/i3-mountains.git &&
git fetch --all &&
git pull &&
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc &&
exec zsh
