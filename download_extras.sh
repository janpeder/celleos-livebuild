#!/bin/bash

# Download GeoGebra:
wget https://download.geogebra.org/package/linux-port
mkdir -p rawfilesinstall/opt
tar xvfj linux-port -C rawfilesinstall/opt/
rm linux-port
mv rawfilesinstall/opt/GeoGebra* rawfilesinstall/opt/geogebra

# Download GeoGebra icon:
wget https://wiki.geogebra.org/uploads/c/cc/GeoGebra_48.png
mkdir -p rawfilesinstall/usr/share/pixmaps
mv GeoGebra_48.png rawfilesinstall/usr/share/pixmaps/geogebra.png

# Download Dash to Dock:
wget https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v69.shell-extension.zip
mkdir -p rawfilesinstall/etc/skel/.local/share/gnome-shell/extensions/dash-to-dock\@micxgx.gmail.com
unzip dash-to-dockmicxgx.gmail.com.v69.shell-extension.zip -d rawfilesinstall/etc/skel/.local/share/gnome-shell/extensions/dash-to-dock\@micxgx.gmail.com/
rm dash-to-dockmicxgx.gmail.com.v69.shell-extension.zip

# Download Mu
wget https://github.com/mu-editor/mu/releases/download/v1.2.0/MuEditor-Linux-1.2.0-x86_64.AppImage
mv MuEditor-Linux-1.2.0-x86_64.AppImage rawfilesinstall/opt/
chmod 755 rawfilesinstall/opt/MuEditor-Linux-1.2.0-x86_64.AppImage

# Download Mu icon
wget https://user-images.githubusercontent.com/37602/30643992-d27673fe-9e08-11e7-8a93-cb640d397e07.png
mv 30643992-d27673fe-9e08-11e7-8a93-cb640d397e07.png rawfilesinstall/usr/share/pixmaps/mu.png

# Download and build libdvdcss (for DVD decryption)
INSTALLPATH=$(pwd)/rawfilesinstall/usr/local
DOWNLOADURL=https://get.videolan.org/libdvdcss/1.4.2/libdvdcss-1.4.2.tar.bz2
ARCHIVEFILE=libdvdcss-1.4.2.tar.bz2 
DIRECTORY=libdvdcss-1.4.2/
mkdir -p $INSTALLPATH
wget $DOWNLOADURL
tar xvfj $ARCHIVEFILE
cd $DIRECTORY
./configure --prefix=$INSTALLPATH
make || exit
make install || exit
cd ..
rm -r $DIRECTORY
rm $ARCHIVEFILE
