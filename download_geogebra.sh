#!/bin/bash
wget https://download.geogebra.org/package/linux-port
tar xvfj linux-port -C rawfilesinstall/opt/
rm linux-port
mv rawfilesinstall/opt/GeoGebra* rawfilesinstall/opt/geogebra
