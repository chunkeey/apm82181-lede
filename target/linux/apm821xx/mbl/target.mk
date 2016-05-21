BOARDNAME := MyBook Live Series
FEATURES += ext4 usb
DEFAULT_PACKAGES += partx-utils block-mount kmod-dm kmod-md-mod e2fsprogs badblocks

define Target/Description
	Build firmware images for Western Digital's My Book Live Series.
endef

$(eval $(call $(if $(CONFIG_TARGET_ROOTFS_EXT4FS),RequireCommand,Ignore),genext2fs, \
        Please install genext2fs. \
))
