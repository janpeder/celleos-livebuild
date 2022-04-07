# Makefile building the installation media for celleos

lbconfigparams = -a amd64 -b iso-hybrid --iso-application celleos --iso-preparer "Jan Peder David-Andersen" --iso-volume celleos-install --debian-installer live --archive-areas "main contrib" --win32-loader false --updates true
builddir = build
builtisoname = live-image-amd64.hybrid.iso
modifiedisoname = celleos-ISO-MBR.iso

default: $(builddir)/$(modifiedisoname)

$(builddir): celleos.list.chroot wine32.hook.chroot
	lb clean
	mkdir -p $(builddir)
	cd $(builddir); lb config $(lbconfigparams)
	cp celleos.list.chroot $(builddir)/config/package-lists/
	cp wine32.hook.chroot $(builddir)/config/hooks/live
	cp -R rawfilesinstall/* $(builddir)/config/includes.chroot_after_packages/

$(builddir)/$(builtisoname): $(builddir)
	cd $(builddir); lb build

$(builddir)/$(modifiedisoname): $(builddir)/$(builtisoname) addfilestoiso.sh preseed.cfg
	sh addfilestoiso.sh $(builddir)/$(builtisoname) $(builddir)/$(modifiedisoname)

clean:
	rm -rf $(builddir)
