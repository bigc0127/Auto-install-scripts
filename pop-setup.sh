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
sudo apt install vim curl ruby fish -y

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
mv -v ./por ~/.utils
mv -v ./help.txt ~/.utils
mv -V ./config.txt ~/.utils
chmod 755 ~/.utils/por
chmod 755 ~/.utils/help.txt
chmod 755 ~/.utils/config.txt
echo 'export PATH="$HOME/.utils:$PATH"' >> ~/.bashrc

#Setting up fish
curl -o fastfetch.deb https://github.com/bigc0127/Auto-install-scripts/raw/main/fastfetch-1.9.1-Linux.deb
sudo apt install ./fastfetch.deb -y
mv -v ./config.fish ~/.config/fish/

#Installing Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

#Installing Teamviewer
curl -o teamviewer.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
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

#The End
echo "all done, Welcome home"
echo "recommend reboot now for full effect"

