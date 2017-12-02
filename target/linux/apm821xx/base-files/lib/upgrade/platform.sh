#!/bin/sh

PART_NAME=firmware
REQUIRE_IMAGE_METADATA=1

platform_check_image() {
	local board=$(board_name)

	[ "$#" -gt 1 ] && return 1

	case "$board" in
	wd,mybooklive|\
	wd,mybooklive-duo)
		mbl_do_platform_check "$1"
		return $?;
		;;

	meraki,buckminster|\
	meraki,ikarem|\
	netgear,wndr4700)
		return 0;
		;;

	*)
		;;
	esac

	echo "Sysupgrade is not yet supported on $board."
	return 1
}

platform_pre_upgrade() {
	local board=$(board_name)

	case "$board" in
	meraki,buckminster|\
	meraki,ikarem|\
	netgear,wndr4700)
		nand_do_upgrade "$1"
		;;

	*)
		;;
	esac
}

platform_do_upgrade() {
	local board=$(board_name)

	case "$board" in
	wd,mybooklive|\
	wd,mybooklive-duo)
		mbl_do_upgrade "$ARGV"
		;;

	*)
		default_do_upgrade "$ARGV"
		;;
	esac
}

platform_copy_config() {
	local board=$(board_name)

	case "$board" in
	wd,mybooklive|\
	wd,mybooklive-duo)
		mbl_copy_config
		;;

	*)
		;;
	esac
}

disable_watchdog() {
	killall watchdog
	( ps | grep -v 'grep' | grep '/dev/watchdog' ) && {
		echo 'Could not disable watchdog'
		return 1
	}
}

append sysupgrade_pre_upgrade disable_watchdog
