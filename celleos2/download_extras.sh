#!/bin/bash

# Download GeoGebra:
wget https://download.geogebra.org/package/linux-port
mkdir -p rawfilesinstall/opt
tar xvfj linux-port -C rawfilesinstall/opt/
rm linux-port
mv rawfilesinstall/opt/GeoGebra* rawfilesinstall/opt/geogebra

# Download GeoGebra icon:
#wget https://wiki.geogebra.org/uploads/c/cc/GeoGebra_48.png
#mkdir -p rawfilesinstall/usr/share/pixmaps
#mv GeoGebra_48.png rawfilesinstall/usr/share/pixmaps/geogebra.png

# Download Dash to Dock:
wget https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v69.shell-extension.zip
mkdir -p rawfilesinstall/etc/skel/.local/share/gnome-shell/extensions/dash-to-dock\@micxgx.gmail.com
unzip dash-to-dockmicxgx.gmail.com.v69.shell-extension.zip -d rawfilesinstall/etc/skel/.local/share/gnome-shell/extensions/dash-to-dock\@micxgx.gmail.com/
rm dash-to-dockmicxgx.gmail.com.v69.shell-extension.zip

# Download Visual Studio Code:
mkdir -p standalone-debs
wget -O standalone-debs/code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
dpkg-name standalone-debs/code.deb

# Download IdeaMaker:
mkdir -p standalone-debs
cd standalone-debs
wget https://download.raise3d.com/ideamaker/release/4.3.3/ideaMaker_4.3.3.6560-ubuntu_amd64.deb
cd ..
