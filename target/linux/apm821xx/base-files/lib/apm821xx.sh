#!/bin/sh

apm821xx_board_detect() {
	local model
	local name

	model=$(awk 'BEGIN{FS="[ \t]+:[ \t]"} /model/ {print $2}' /proc/cpuinfo)

	case "$model" in
	*"Meraki MR24 Access Point")
		name="mr24"
		;;

	*"Meraki MX60/MX60W Security Appliance")
		name="mx60"
		;;

	*"MyBook Live"*)
		name="mbl"
		;;

	*"Netgear WNDR4700/WNDR4720 Series")
		name="wndr4700"
		;;

	esac

	# use generic board detect if no name is set
	[ -z "$name" ] && return

	[ -e "/tmp/sysinfo/" ] || mkdir -p "/tmp/sysinfo/"

	echo "$name > /tmp/sysinfo/board_name
	echo "$model" > /tmp/sysinfo/model
}
