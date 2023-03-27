#!/bin/bash

# Delete GeoGebra:
rm -r rawfilesinstall/opt/geogebra

# Delete GeoGebra icon:
rm rawfilesinstall/usr/share/pixmaps/geogebra.png

# Delete Dash to Dock:
rm -r rawfilesinstall/etc/skel/.local/share/gnome-shell/extensions/dash-to-dock\@micxgx.gmail.com

# Delete libdvdcss
rm -rf rawfilesinstall/usr/local/include/dvdcss
rm -f rawfilesinstall/usr/local/lib/libdvdcss*
rm -f rawfilesinstall/usr/local/lib/pkgconfig/libdvdcss.pc
rm -rf rawfilesinstall/usr/local/share/doc/libdvdcss
