#!/bin/bash

# Download GeoGebra:
wget https://download.geogebra.org/package/linux-port
mkdir -p to-target-root/opt
tar xvfj linux-port -C to-target-root/opt/
rm linux-port
mv to-target-root/opt/GeoGebra* to-target-root/opt/geogebra

# Download GeoGebra icon:
# Not working. GeoGebra icon is added to git repo instead.
#wget https://wiki.geogebra.org/uploads/c/cc/GeoGebra_48.png
#mkdir -p to-target-root/usr/share/pixmaps
#mv GeoGebra_48.png to-target-root/usr/share/pixmaps/geogebra.png

# Download Jan
mkdir -p standalone-debs
wget -O standalone-debs/jan.deb "https://github.com/janhq/jan/releases/download/v0.5.11/jan-linux-amd64-0.5.11.deb"
dpkg-name standalone-debs/jan.deb


# Download Visual Studio Code:
mkdir -p standalone-debs
wget -O standalone-debs/code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
dpkg-name standalone-debs/code.deb

# Download IdeaMaker:
mkdir -p standalone-debs
cd standalone-debs
wget https://download.raise3d.com/ideamaker/release/4.3.3/ideaMaker_4.3.3.6560-ubuntu_amd64.deb
cd ..
