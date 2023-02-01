#!/bin/bash

#Updating base system
sudo apt update
sudo apt upgrade -y
flatpak update -y

#Install debs
sudo apt install neovim curl ruby fish p7zip-full exa gnome-tweaks bibletime cmake steam -y

#Install flatpaks
flatpak install chat.schildi.desktop org.pipewire.Helvum com.atlauncher.ATLauncher com.microsoft.Edge com.microsoft.Teams org.gnome.Boxes org.onlyoffice.desktopeditors org.telegram.desktop com.bitwarden.desktop com.discordapp.Discord com.google.AndroidStudio com.heroicgameslauncher.hgl com.obsproject.Studio com.obsproject.Studio.Plugin.Gstreamer com.obsproject.Studio.Plugin.InputOverlay com.obsproject.Studio.Plugin.MoveTransition com.obsproject.Studio.Plugin.NVFBC com.obsproject.Studio.Plugin.OBSVkCapture com.obsproject.Studio.Plugin.ScaleToSound com.obsproject.Studio.Plugin.SceneSwitcher com.obsproject.Studio.Plugin.TransitionTable com.obsproject.Studio.Plugin.WebSocket com.obsproject.Studio.Plugin.waveform com.spotify.Client com.synology.SynologyDrive in.srev.guiscrcpy io.github.mimbrero.WhatsAppDesktop io.github.prateekmedia.appimagepool net.davidotek.pupgui2 net.openra.OpenRA org.ardour.Ardour org.jitsi.jitsi-meet org.raspberrypi.rpi-imager org.signal.Signal us.zoom.Zoom org.videolan.VLC -y
flatpak update -y

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

#Change Shell
chsh -s /usr/bin/fish

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

#Install ROC Control Center
cd ~/
git clone https://gitlab.com/asus-linux/asusctl.git
cd ./asusctl
sudo apt install cmake libclang-dev libudev-dev libgtk-3-dev libclang-dev libglib2.0-dev libatkmm-1.6-dev libpangomm-1.4-dev librust-gdk-pixbuf-dev
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
make
sudo make install


#The End
echo "all done, Welcome home"
echo "recommend reboot now for full effect"

