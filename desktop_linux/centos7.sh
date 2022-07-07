#!/bin/bash
set -x

# install dependancies
sudo yum install epel-release stow zsh libX11-devel libXinerama-devel libXft-devel libffi-devel centos-release-scl devtoolset-9

# clone repos
mkdir -p ~/repos
cd ~/repos
#git clone https://github.com/qtile/qtile.git
git clone https://gitlab.com/dwt1/dmenu-distrotube.git
git clone https://gitlab.com/dwt1/wallpapers.git
git clone https://gitlab.com/dwt1/shell-color-scripts.git

# install python
cd ~/Downloads
wget https://www.python.org/ftp/python/3.10.5/Python-3.10.5.tgz
tar xzf Python-3.10.5.tgz
cd Python-3.10.5
./configure --enable-optimizations
sudo make altinstall

# install color scripts
cd ~/repos/shell-color-scripts/
sudo make install

# install dmenu
cd ~/repos/dmenu-distrotube
scl enable devtoolset-9 'sudo make clean install' && rm config.h

# install qtile
backend_type=$(loginctl show-session $(loginctl|grep $(whoami) |awk '{print $1}') -p Type)
backend=${backend_type#*=}
if [ $backend = "x11" ] ; then
  echo "Installing X11 dependancies"
  sudo pip3 install --no-cache-dir cffi xcffib
  sudo pip3 install --no-cache-dir cairocffi
  cd ~/repos/qtile
  sudo pip3 install .
else
# wayland
fi

# generate key and add it to personal github
ssh-keygen
cat ~/.ssh/id_rsa.pub
set +x
echo "Press any key to continue"
keypress=0
while [ $keypress = 0 ] ; do
  read -t 3 -n 1
  if [ $? = 0 ] ; then
    keypress=1 ;
  fi
done
set -x

# clone dotfiles
cd ~ &&
git clone git@github.com:jmhufford/.dotfiles.git
cd ~/.dotfiles &&
./install.sh


