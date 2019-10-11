#!/bin/sh

. /lib/functions.sh

# It seems like ASRock tried to implement a failover firmware
# but the partitions are empty. Otherwise we could just share
# this portion with the buffalo.sh script.

asrock_upgrade_prepare_ubi() {
	local ubidev="$( nand_find_ubi ubi )"

	# Just delete these partitions if present and use
	# OpenWrt's standard names for those.
	ubirmvol /dev/$ubidev -N ubi_rootfs &> /dev/null || true
	ubirmvol /dev/$ubidev -N ubi_rootfs_data &> /dev/null || true
}
