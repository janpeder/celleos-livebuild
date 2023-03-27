# Makefile building the installation media for celleos

lbconfigparams = -a amd64 -b iso-hybrid --iso-application celleos --iso-preparer "Jan Peder David-Andersen" --iso-volume celleos-install --debian-installer live --archive-areas "main contrib" --win32-loader false --updates true
builddir = build
builtisoname = live-image-amd64.hybrid.iso
modifiedisoname = celleos.iso

default: $(builddir)/$(modifiedisoname)

$(builddir)/configured_date: celleos.list.chroot wine32.hook.chroot rawfilesinstall/etc/skel/.config/dconf/user
	rm -rf $(builddir)/config/includes.chroot_after_packages/*
	mkdir -p $(builddir)
	cd $(builddir); lb clean --all
	cd $(builddir); lb config $(lbconfigparams)
	cp celleos.list.chroot $(builddir)/config/package-lists/
	cp wine32.hook.chroot $(builddir)/config/hooks/live
	cp -R rawfilesinstall/* $(builddir)/config/includes.chroot_after_packages/
	date > $(builddir)/configured_date
	cp $(builddir)/configured_date $(builddir)/config/includes.chroot_after_packages/root/celleos_build_date

$(builddir)/$(builtisoname): $(builddir)/configured_date
	cd $(builddir); lb build

$(builddir)/$(modifiedisoname): $(builddir)/$(builtisoname) addfilestoiso.sh preseed.cfg menu.cfg grub.cfg
	sh addfilestoiso.sh $(builddir)/$(builtisoname) $(builddir)/$(modifiedisoname)

rawfilesinstall/etc/skel/.config/dconf/user: dconfsettings.d/extensions dconfsettings.d/desktopbackgroundsettings dconfsettings.d/favoriteappssettings
	mkdir -p rawfilesinstall/etc/skel/.config/dconf
	dconf compile rawfilesinstall/etc/skel/.config/dconf/user dconfsettings.d

clean:
	rm -rf $(builddir)
	rm -f rawfilesinstall/etc/skel/.config/dconf/user
