#!/bin/bash

read -r -p "Elevbruker vil bli nullstilt. Sikker? \"J\" for å fortsette [J/N] " response
case "$response" in
    [jJ]) 
	rm -rf /home/elev
	tar xf /root/backup_elevhome.tar -C /
	chown -R elev /home/elev
	chgrp -R elev /home/elev
	echo "Elevbruker er nullstilt."
        ;;
    *)
	echo "Ok. Avbryter."
        ;;
esac
