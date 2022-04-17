#!/bin/bash

if [ "$(id -u)" != "0" ]
then
  echo "This script must be run as root" 1>&2
  exit 1
fi

if [ $# -ne 2 ]
then
    echo "Usage: $0 <input-iso> <output-iso>"
    exit 1
fi

iso=$1
output=$2
preseed=preseed.cfg

lpdir=__loopdir__
cddir=__cd__
irdir=__irmod__

# Copy contents from existing ISO:
mkdir $lpdir
mount -o loop $iso $lpdir
rm -rf $cddir
mkdir $cddir
rsync -a -H --exclude=TRANS.TBL $lpdir/ $cddir
umount $lpdir

# Update initrd in install/gtk:
# This is the initrd which is loaded when choosing to install from the grub menu on the installation media
mkdir $irdir
cd $irdir
gzip -d < ../$cddir/install/gtk/initrd.gz | \
    cpio --extract --make-directories --no-absolute-filenames
cp ../$preseed preseed.cfg
find . | cpio -H newc --create | \
    gzip -9 > ../$cddir/install/gtk/initrd.gz
cd ../
rm -rf $irdir

# Backup /isolinux/menu.cfg and write a modified one:
cp $cddir/isolinux/menu.cfg $cddir/isolinux/menu.cfg.old
cp menu.cfg $cddir/isolinux/menu.cfg
cp splash.png $cddir/isolinux/

# Remove the checksums as they are no longer valid
rm -f $cddir/sha256sum.txt
rm -f $cddir/sha256sum.README
rm -f $cddir/md5sum.txt
rm -f $cddir/md5sum.README

# Create iso
genisoimage -o $output -r -J -no-emul-boot -boot-load-size 4 -boot-info-table -b isolinux/isolinux.bin -c isolinux/boot.cat ./$cddir

# Make it a bootable disk image
# (If we dont do this it will only be bootable if burned to a physical CD)
isohybrid $output

# Clean up
rm -rf $lpdir
rm -rf $cddir
