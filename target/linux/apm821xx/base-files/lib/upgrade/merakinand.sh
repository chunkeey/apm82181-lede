#!/bin/sh
#
# Copyright (C) 2016 Chris Blake <chrisrblake93@gmail.com>
#
# Custom upgrade script for Meraki NAND devices (ex. MR24)
# Based on merakinand.sh from the ar71xx target
#
. /lib/functions.sh

merakinand_do_upgrade() {
	local tar_file="$1"
	local board_name="$(board_name)"

	# Do we need to do any platform tweaks?
	case "$board_name" in
	"meraki,ikarem"|\
	"meraki,buckminster")
		nand_do_upgrade $1
		;;
	*)
		echo "Unsupported device $board_name";
		exit 1
		;;
	esac
}
