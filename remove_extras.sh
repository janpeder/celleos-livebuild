#!/bin/bash

# Delete GeoGebra:
rm -rf rawfilesinstall/opt/geogebra

# Delete GeoGebra icon:
rm -f rawfilesinstall/usr/share/pixmaps/geogebra.png

# Delete Dash to Dock:
rm -rf rawfilesinstall/etc/skel/.local/share/gnome-shell/extensions/dash-to-dock\@micxgx.gmail.com

# Delete libdvdcss
rm -rf rawfilesinstall/usr/local/include/dvdcss
rm -f rawfilesinstall/usr/local/lib/libdvdcss*
rm -f rawfilesinstall/usr/local/lib/pkgconfig/libdvdcss.pc
rm -rf rawfilesinstall/usr/local/share/doc/libdvdcss

# Delete Visual Studio Code
rm -f standalone-debs/code*.deb

# Delete IdeaMaker:
rm -f standalone-debs/ideaMaker*.deb
