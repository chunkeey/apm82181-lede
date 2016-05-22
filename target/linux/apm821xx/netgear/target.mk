BOARDNAME:=Netgear Centria N900 WNDR4700/WNDR4720
FEATURES += nand pcie usb ramdisk squashfs
DEFAULT_PACKAGES += partx-utils block-mount kmod-dm kmod-md-mod e2fsprogs badblocks swconfig renesas-fw

define Target/Description
	Build firmware images for Netgear Centria N900 WNDR4700/WNDR4720 APs.
endef
