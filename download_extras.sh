#!/bin/bash

# Download GeoGebra:
wget https://download.geogebra.org/package/linux-port
tar xvfj linux-port -C rawfilesinstall/opt/
rm linux-port
mv rawfilesinstall/opt/GeoGebra* rawfilesinstall/opt/geogebra

# Download Dash to Dock:
wget https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v69.shell-extension.zip
unzip dash-to-dockmicxgx.gmail.com.v69.shell-extension.zip -d rawfilesinstall/home/elev/.local/share/gnome-shell/extensions/dash-to-dock\@micxgx.gmail.com/
rm dash-to-dockmicxgx.gmail.com.v69.shell-extension.zip
