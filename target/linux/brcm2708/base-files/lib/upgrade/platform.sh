REQUIRE_IMAGE_METADATA=1

platform_check_image() {
	return 0
}

platform_do_upgrade() {
	sync
	get_image "$1" | dd of=/dev/mmcblk0 bs=2M conv=fsync
	sleep 1
}

platform_copy_config() {
	mkdir -p /boot
	[ -f /boot/kernel.img ] || mount -t vfat -o rw,noatime /dev/mmcblk0p1 /boot
	cp -af "$CONF_TAR" /boot/
	tar --directory / -xvf "$CONF_TAR" boot/config.txt
	sync
	umount /boot
}
