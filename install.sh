#!/usr/bin/env bash

sudo pacman -Syyu --noconfirm rofi git base-devel xfce4-terminal zsh
cp nimdow/config.toml ~/.config/
sudo cp bin/launcher /usr/bin
sudo cp bin/mpd /usr/bin
sudo cp bin/network /usr/bin
sudo cp bin/powermenu /usr/bin
sudo cp bin/screenshot /usr/bin
sudo cp bin/windows /usr/bin
cd /tmp && sudo git clone https://aur.archlinux.org/nimdow-bin.git
cd nimdow-bin || exit && echo "Nimdow installation failed"
makepkg -si
echo "Successfully installed nimdow and synced dotfiles!"
cd ~/Downloads
git clone https://github.com/Infinitybeond1/slstatus
cd slstatus
sudo make clean install
echo "Successfully installed slstatus!"
cd ~/Downloads
git clone https://github.com/arcticicestudio/nord-xfce-terminal
cd nord-xfce-terminal
./install.sh
echo "Successfully installed terminal theming!"

# Finished
echo "Killing current desktop enviroment in 30 seconds. Press ctrl+c to cancel"
sleep 30s
sudo killall Xorg || exec nimdow
