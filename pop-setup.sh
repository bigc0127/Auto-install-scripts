#!/bin/bash

#Updating base system
sudo apt update
sudo apt upgrade -y
flatpak update -y

#DNS Settings
echo "adding DNS"
echo "DNS=76.76.2.22#1s30mlh7mai.dns.controld.com" >> /etc/systemd/resolved.conf
echo "DNSOverTLS=yes" >> /etc/systemd/resolved.conf

#Install debs
sudo apt install vim curl ruby fish p7zip-full exa gnome-tweaks-y

#Install flatpaks
flatpak install chat.schildi.desktop com.atlauncher.ATLauncher com.microsoft.Edge com.microsoft.Teams org.gnome.Boxes org.onlyoffice.desktopeditors org.telegram.desktop -y
flatpak update -y

#Change Shell
chsh /usr/bin/fish

#Downloading por
curl -o por https://raw.githubusercontent.com/bigc0127/por/main/por
curl -o help.txt https://raw.githubusercontent.com/bigc0127/por/main/help.txt
curl -o config.txt https://raw.githubusercontent.com/bigc0127/por/main/config.txt

#Installing Por
mkdir ~/.utils
mv -v ./por ~/.utils/
mv -v ./help.txt ~/.utils/
mv -v ./config.txt ~/.utils/
chmod 755 ~/.utils/por
chmod 755 ~/.utils/help.txt
chmod 755 ~/.utils/config.txt
echo 'export PATH="$HOME/.utils:$PATH"' >> ~/.bashrc

#Setting up fish
sudo apt install ./fastfetch*.deb -y
mkdir ~/.config/fish/
mv -v ./config.fish ~/.config/fish/

#Installing Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

#Installing Teamviewer
curl -o teamviewer.deb https://cloud.needlingworldwide.com/s/ZzDjbQQHz7Yecgb/download/teamviewer_15.38.3_amd64.deb
sudo apt install ./teamviewer.deb -y

#Installing Vivaldi
curl -o vivaldi.deb https://downloads.vivaldi.com/stable/vivaldi-stable_5.6.2867.62-1_amd64.deb
sudo apt install ./vivaldi.deb -y

#Wallpapers
mv -v ./P1/* ./Purple/
mv -v ./P2/* ./Purple/
mv -v ./P3/* ./Purple/
mv -v ./P4/* ./Purple/
mv -v ./P5/* ./Purple/
mkdir ./Wallpapers
mv -v ./Purple ./Wallpapers/
mv -v ./Other ./Wallpapers/
mv -v ./Tech ./Wallpapers/
mv -v ./76walls ./Wallpapers/
mv -v ./Wallpapers ~/Pictures/

#Themes and Icons
mv -v ./looks.7z ~/
mv -v ./gtk-4.0/* ~/.config/gtk-4.0/
cd ~/
7z x ./looks.7z -y

#Setting up themes
cd ~/Auto-install-scripts/
7z x ./gnome-shell.7z -y
rm -rfv ~/.local/share/gnome-shell
mv -v ./gnome-shell ~/.local/share/
gnome-tweaks

#Remove bullshit
sudo apt purge libreoffice* firefox* -y


#The End
echo "all done, Welcome home"
echo "recommend reboot now for full effect"

