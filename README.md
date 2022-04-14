# celleos-livebuild

Variant of Debian Linux for use in prison cells by prisoners without supervision. Focus is on security and education.

Features:
* Quick and easy install with USB stick and no internet, with minimal user interaction. Reason: Minimize work and minimize possible mistakes during installations.
* Blocking of all USB devices exept keyboard, mice and whitelisted USB sticks (mass storage). This is done with the USBGuard software.
* Blocking of all internet using firewall (iptables).
* Comes with software suited for educational purposes.

### Build instructions
The following steps describes how to build a ISO image for installing celleos. You need to be on a Debian system for this to work, as it is based on Debian Live Build. You need to be connected to the Internet for this to work.

First, install the required packages (as root):
```
apt update
apt install live-build genisoimage syslinux-utils git
```

Then, check out this repository from github:
```
git clone https://github.com/janpeder/celleos-livebuild
```

Now 'cd' into the directory you just cloned:
```
cd celleos-livebuild
```
Run the script to download various extra files (GeoGebra, Dash to Dock..):
```
sh download_extras
```
Start the build process by typing:
```
make
```
Now, cross your fingers and hope everything works out as intended. This step may take some 10 - 30 minutes time, as some serious downloading and processing will take place. If all goes well a 'build' directory will be created, and inside this directory you will find a file named 'celleos-ISO-MBR.iso'.

The final step will be to write the file 'celleos-ISO-MBR.iso' to a USB stick. I prefer to use the command 'dd' for this. Before we can write the image, we need to know the device file for the USB stick. One way to find the correct device file is by typing 'dmesg' in the terminal just after plugging the USB stick into the computer. To write the image to the stick, assuming the stick is /dev/sdb, type:
```
dd if=build/celleos-ISO-MBR.iso of=/dev/sdb
```


Good luck!
