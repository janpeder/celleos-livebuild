#!/bin/bash

read -r -p "Elevbruker vil bli nullstilt. Sikker? \"J\" for å fortsette [J/N] " response
case "$response" in
    [jJ]) 
	rm -rf /home/elev
	cp -R /etc/skel /home/elev
	chown -R elev /home/elev
	chgrp -R elev /home/elev
	passwd -u -d elev
	echo "Elevbruker er nullstilt."
        ;;
    *)
	echo "Ok. Avbryter."
        ;;
esac
