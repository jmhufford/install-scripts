sudo pacman -Sy base-devel qtile git \
  python nitrogen picom openssh alacritty \
  firefox zsh sddm stow lxsession \
  volumeicon network-manager-applet

ssh-keygen

get dotfiles
install dotfiles

mkdir -p ~/repos
cd ~/repos
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

cd ~/repos
git clone https://gitlab.com/dwt1/dmenu-distrotube.git
cd dmenu-distrotube
makepkg -cfd
sudo pacman -U *.pkg.tar.zst

cd ~/repos
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
makepkg -cf
sudo pacman -U *.pkg.tar.zst

cd ~/repos
git clone https://gitlab.com/dwt1/wallpapers.git
